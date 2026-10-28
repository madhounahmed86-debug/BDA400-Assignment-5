# BDA400 Assignment 5 — Technical Analysis using R (Development Phase)

**Student:** Ahmed Almadhoun  
**Course:** BDA400 — Data Science Tools and Techniques  
**Assignment:** Assignment 5 — Technical Analysis using R, Development Phase  
**Repository URL:** [[PASTE YOUR GITHUB REPOSITORY URL HERE BEFORE SUBMISSION](https://github.com/madhounahmed86-debug/BDA400-Assignment-5)]

## Contents
- `R_scripts/sma.R` — Simple Moving Average
- `R_scripts/ema.R` — Exponential Moving Average
- `R_scripts/macd.R` — MACD line, signal line, and histogram
- `R_scripts/stdev.R` — Population standard deviation as described in the assignment
- `R_scripts/linreg.R` — Simple linear regression
- `R_scripts/rsi.R` — Relative Strength Index with Wilder smoothing
- `R_scripts/stoch_rsi.R` — Stochastic RSI %K and %D
- `R_scripts/crossover.R` — Up/down crossover signals
- `R_scripts/crossunder.R` — Crossunder signals
- `Documentation/Technical_Analysis_Explanation.docx` — explanation of algorithms and usage
- `Cover_Page.docx` — assignment cover page

## Requirements
These functions use base R only and do not require external packages. Source the scripts before calling functions that depend on other functions.

## How to run
Open RStudio and set the working directory to this project folder, then run:

```r
source("R_scripts/sma.R")
source("R_scripts/ema.R")
source("R_scripts/macd.R")
source("R_scripts/stdev.R")
source("R_scripts/linreg.R")
source("R_scripts/rsi.R")
source("R_scripts/stoch_rsi.R")
source("R_scripts/crossover.R")
source("R_scripts/crossunder.R")

# Example checks
prices <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
sma(prices, 3)
ema(prices, 3)
macd(prices, 3, 5, 2)
stdev(prices)
linreg(prices, 5, 0)
rsi(prices, 3)
stoch_rsi(prices, 3, 3, 3)
crossover(c(1, 2, 4), c(2, 2, 3))
crossunder(c(3, 2, 1), c(2, 2, 2))
```

## Notes
- The provided assignment asks for separate R scripts, brief explanations, and a cover page containing the repository link.
- Replace the repository placeholder in this README and cover page with your actual repository URL.
- The supplied PDF is the assignment brief, not a stock-data file. These functions are implemented and demonstrated using sample numeric vectors; add the dataset from Assignment 1 if your instructor expects it to be included in the repository.
