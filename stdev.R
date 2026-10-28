# BDA400 Assignment 5 - Standard Deviation
# Uses the population standard deviation formula specified in the assignment.
stdev <- function(data) {
  if (!is.numeric(data) || length(data) == 0 || anyNA(data)) {
    stop("data must be a non-empty numeric vector without NA values")
  }
  mean_value <- sum(data) / length(data)
  diff_values <- data - mean_value
  squared_diff <- diff_values * diff_values
  variance <- sum(squared_diff) / length(squared_diff)
  standard_deviation <- sqrt(variance)
  return(standard_deviation)
}
