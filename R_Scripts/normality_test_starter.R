
library(stats) 
# Specify the variable for the Kolmogorov-Smirnov test
variable_name <- "Age"  # Replace with the actual column name
variable_data <- na.omit(data[[variable_name]])  # Remove missing values

# Check if the variable exists in the dataset
if (!variable_name %in% names(data)) {
  stop(paste("Variable", variable_name, "not found in the dataset."))
}

# Calculate mean and standard deviation for the variable
variable_mean <- mean(variable_data)
variable_sd <- sd(variable_data)

# Perform the Kolmogorov-Smirnov test
ks_test <- ks.test(variable_data, "pnorm", mean = variable_mean, sd = variable_sd)

# Print the results
cat("\nKolmogorov-Smirnov Test for", variable_name, ":\n")
print(ks_test)

# Interpretation
alpha <- 0.05  # Significance level
if (ks_test$p.value < alpha) {
  cat("The", variable_name, "data does not follow a normal distribution (reject H0).\n")
} else {
  cat("The", variable_name, "data follows a normal distribution (fail to reject H0).\n")
}

# Plot the distribution for the variable
ggplot(data, aes_string(x = variable_name)) +
  geom_histogram(aes(y = ..density..), bins = 15, fill = "green", alpha = 0.6) +
  stat_function(fun = dnorm, args = list(mean = variable_mean, sd = variable_sd), color = "black", size = 1) +
  labs(title = paste("Histogram and Normal Distribution Curve:", variable_name),
       x = variable_name, y = "Density") +
  theme_minimal()
