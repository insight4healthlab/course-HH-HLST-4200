# Install and load required package
install.packages("ISLR")  # Uncomment if not installed
library(ISLR)

# Load the Default dataset
data(Default)

# View the first few rows of the dataset
head(Default)

# Create a contingency table for Default (Yes/No) vs Student (Yes/No)
table_data <- table(Default$default, Default$student)
print(table_data)

# Perform Chi-Square Test
chi_sq_test <- chisq.test(table_data)

# Display the results
print(chi_sq_test)

# Check expected values to ensure validity of the test
print(chi_sq_test$expected)
