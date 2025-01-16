# Check statistical significance
alpha <- 0.05  # Significance level
if (test$p.value < alpha) {
  cat("The correlation is statistically significant.\n")
} else {
  cat("The correlation is not statistically significant.\n")
}

# Compute covariance
covariance <- cov(data$Salary, data$WorkLoad)
cat("Covariance:", covariance, "\n")

# Interpretation of correlation coefficient
if (abs(correlation) > 0.7) {
  cat("Strong correlation.\n")
} else if (abs(correlation) > 0.3) {
  cat("Moderate correlation.\n")
} else {
  cat("Weak correlation.\n")
}

# Compute Spearman's rank correlation
spearman_test <- cor.test(data$Salary, data$WorkLoad, method = "spearman")
cat("Spearman's rank correlation between Salary and Workload:", spearman_test$estimate, "\n")
cat("P-value:", spearman_test$p.value, "\n")

# Check statistical significance for Spearman's correlation
if (spearman_test$p.value < alpha) {
  cat("The Spearman correlation is statistically significant.\n")
} else {
  cat("The Spearman correlation is not statistically significant.\n")
}

# Interpretation of Spearman's correlation coefficient
if (abs(spearman_test$estimate) > 0.7) {
  cat("Strong Spearman correlation.\n")
} else if (abs(spearman_test$estimate) > 0.3) {
  cat("Moderate Spearman correlation.\n")
} else {
  cat("Weak Spearman correlation.\n")
}
