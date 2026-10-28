# BDA400 Assignment 5 - Relative Strength Index (RSI)
rsi <- function(data, period) {
  if (!is.numeric(data) || length(data) < 2 || anyNA(data)) {
    stop("data must be a numeric vector with at least two values and no NA values")
  }
  if (length(period) != 1 || !is.finite(period) || period < 1 ||
      period != as.integer(period)) {
    stop("period must be a positive integer")
  }
  period <- as.integer(period)
  if (length(data) <= period) {
    stop("data length must be greater than period")
  }

  diff_values <- diff(data)
  gains <- ifelse(diff_values > 0, diff_values, 0)
  losses <- ifelse(diff_values < 0, abs(diff_values), 0)
  rsi_values <- rep(NA_real_, length(data))

  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period

  # The first RSI is available at index period + 1.
  if (avg_loss == 0 && avg_gain == 0) {
    rsi_values[period + 1] <- 50
  } else if (avg_loss == 0) {
    rsi_values[period + 1] <- 100
  } else {
    rs <- avg_gain / avg_loss
    rsi_values[period + 1] <- 100 - (100 / (1 + rs))
  }

  if (length(data) > period + 1) {
    for (i in (period + 2):length(data)) {
      avg_gain <- (avg_gain * (period - 1) + gains[i - 1]) / period
      avg_loss <- (avg_loss * (period - 1) + losses[i - 1]) / period
      if (avg_loss == 0 && avg_gain == 0) {
        rsi_values[i] <- 50
      } else if (avg_loss == 0) {
        rsi_values[i] <- 100
      } else {
        rs <- avg_gain / avg_loss
        rsi_values[i] <- 100 - (100 / (1 + rs))
      }
    }
  }
  return(rsi_values)
}
