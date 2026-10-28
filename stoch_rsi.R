# BDA400 Assignment 5 - Stochastic RSI
# Source sma.R and rsi.R before using this function.
stoch_rsi <- function(data, period, k_period, d_period) {
  rsi_values <- rsi(data, period)
  n <- length(rsi_values)

  if (k_period < 1 || k_period != as.integer(k_period) ||
      d_period < 1 || d_period != as.integer(d_period)) {
    stop("k_period and d_period must be positive integers")
  }
  k_period <- as.integer(k_period)
  d_period <- as.integer(d_period)

  k_raw <- rep(NA_real_, n)
  for (i in seq_len(n)) {
    if (i >= k_period && all(!is.na(rsi_values[(i-k_period+1):i]))) {
      window <- rsi_values[(i-k_period+1):i]
      low_value <- min(window)
      high_value <- max(window)
      if (high_value == low_value) {
        k_raw[i] <- 0
      } else {
        k_raw[i] <- (rsi_values[i] - low_value) / (high_value - low_value)
      }
    }
  }

  # %K is the StochRSI value smoothed by a k_period SMA.
  k_line <- rep(NA_real_, n)
  for (i in seq_len(n)) {
    if (i >= k_period && all(!is.na(k_raw[(i-k_period+1):i]))) {
      k_line[i] <- sum(k_raw[(i-k_period+1):i]) / k_period
    }
  }

  d_line <- rep(NA_real_, n)
  for (i in seq_len(n)) {
    if (i >= d_period && all(!is.na(k_line[(i-d_period+1):i]))) {
      d_line[i] <- sum(k_line[(i-d_period+1):i]) / d_period
    }
  }

  return(list(k_line = k_line, d_line = d_line))
}
