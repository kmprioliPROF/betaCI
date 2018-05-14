# https://github.com/kmprioliPROF
# 95% CI calculations for beta-distributed probabilities
# Last updated Mon May 14 10:04:44 2018 ------------------------------


library(readr)
library(dplyr)


#### Read in .csv of point estimates with alpha and beta parameters and subset to beta only ----

betadata <- read_csv("beta_params.csv")
betasub <- filter(betadata, distrib == "beta")
#View(betadata)

#### Establish intervals, parameter vectors, and vector length ----
levs <- c(0.025, 0.975)
alphavec <- betasub$alpha
betavec <-betasub$beta
len <- length(alphavec)

#### Create an empty matrix to hold for loop output
betaints <- matrix(nrow = 2, ncol = len)

#### Loop through vectors to generate confidence intervals for the beta distribution ----
k <- 1

for(i in 1:len){
  betaints[k:(k+1)] <- qbeta(levs, alphavec[i], betavec[i])
  k <- k + 2
}

#### Transpose the matrix ----
betaintstr <- t(betaints)

#### Convert to dataframe ----
betaintsdf <- as.data.frame(betaintstr)

#### Assign column names ----
intnames <- c("low", "high")
colnames(betaintsdf) <- intnames

#### Assign column values to betasub dataset ----
betasub$low <- betaintsdf$low
betasub$high <- betaintsdf$high

#### Write to CSV ----
write.csv(betasub, file = "beta_params_out.csv")