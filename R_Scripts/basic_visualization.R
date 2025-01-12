library(ggplot2)
library(readr)
library(dplyr)
library(reshape2)

# Specify the file path
file_path <- "~/Desktop/CCHS/cchs-82M0013-E-2015-2016-Annual-component_F1-subset.tab"

if (file.exists(file_path)) {
  data <- read.table(file_path, header = TRUE, sep = "\t")
  head(data)
} else {
  stop("The file does not exist. Check the file path.")
}

# Visualization: Basic Statistics
summary(data)

# Visualization: Bar Plot for a Categorical Variable
ggplot(data, aes(x = factor(DOSLP))) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribution of DOSLP", x = "DOSLP", y = "Count") +
  theme_minimal()

# Visualization: Histogram for a Numerical Variable
ggplot(data, aes(x = SLPG005)) +
  geom_histogram(bins = 20, fill = "steelblue", color = "black", alpha = 0.7) +
  geom_density(aes(y = ..density.. * diff(range(data$SLPG005)) / 20), color = "red", size = 1) +
  labs(title = "Histogram of SLPG005", x = "SLPG005", y = "Frequency") +
  theme_minimal()

# Visualization: Scatter Plot for Numerical Variables
ggplot(data, aes(x = SLPG005, y = SLP_010)) +
  geom_point(color = "steelblue", alpha = 0.6) +
  labs(title = "Scatter Plot: SLPG005 vs SLP_010", x = "SLPG005", y = "SLP_010") +
  theme_minimal()

# Visualization: Correlation Heatmap
correlation_matrix <- cor(select(data, where(is.numeric)), use = "complete.obs")
melted_corr <- melt(correlation_matrix)
ggplot(melted_corr, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1), space = "Lab") +
  labs(title = "Correlation Heatmap", x = "", y = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Visualization: Pairplot (Scatterplot Matrix)
selected_columns <- select(data, SLPG005, SLP_010, SLP_015, SLP_020)
pairs(selected_columns, main = "Pairplot of Selected Numerical Columns")

