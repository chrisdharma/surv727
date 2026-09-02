# Example R script for a GitHub classroom demo

public_data <- read.csv("data/public_data.csv")

# Your task: calculate the mean score for the public data.
# Add your code here on your own branch.
mean(public_data$score, na.rm = TRUE)
