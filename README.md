---
title: "README"
author: "https://github.com/kmprioliPROF/"
date: "May 14, 2018"
output: html_document
---

## Purpose

This code generates 95% confidence intervals for beta-distributed probabilities, given a .csv file containing the alpha and beta parameter values.

## Setup

To use this code, modify the included `beta_params.csv` file to reflect the \alpha and \beta parameters for each probability of interest.  Be sure to replace the example variable names with names that make sense for your use case, and indicate which of these variables are beta-distributed.

Column names in `beta_params.csv` refer to the following:

| Column Name   	| Description                           	|
|---------------	|---------------------------------------	|
| `varname`     	| Variable name                         	|
| `distrib`     	| Distribution type                     	|
| `num`         	| Numerator value                       	|
| `denom`       	| Denominator value                     	|
| `alpha`       	| Alpha parameter                       	|
| `beta`        	| Beta parameter                        	|
| `pointest`    	| Point estimate                        	|
| `low`         	| Low value of 95% confidence interval  	|
| `high`        	| High value of 95% confidence interval 	|

**Note that only the** `varname`**,** `distrib`**,** `alpha`**, and** `beta` **columns need to be filled out for this code to work.**

## Running the Code

Running the code is straightforward.  The libraries needed are `readr` and `dplyr`, both of which must be installed on your system to run this code.  If you don't already have these libraries, you can install them via:

`install.packages("readr", "dplyr")`

## Output

The program outputs the low and high values of the 95% confidence intervals to .csv (example output file is included as `beta_params_out.csv`); these values remain present as objects in your global environment if you want to use them in subsequent calculations.