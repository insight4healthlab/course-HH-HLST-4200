# Install required libraries
install.packages("readr")
install.packages("dplyr")

# Load the libraries
library(readr)
library(dplyr)

# Define the data path (update the path to your file)
data_path <- "/content/gdrive/My Drive/your_file_name.tab"

# Function to read the tab-separated file
read_tab_file <- function(data_path) {
  if (file.exists(data_path)) {
    tryCatch({
      # Read the .tab file into a data frame
      df <- read_delim(data_path, delim = "\t")
      cat("File successfully loaded into a DataFrame.\n")
      return(df)
    }, error = function(e) {
      cat("An error occurred:", conditionMessage(e), "\n")
    })
  } else {
    cat("File not found at the path:", data_path, ". Please verify the file location.\n")
  }
}

# Call the function to load the file
data_frame <- read_tab_file(data_path)

# Display the first few rows of the DataFrame
if (!is.null(data_frame)) {
  print(head(data_frame))
}

# Return the data frame
data_frame
4. Mount Google Drive in R
To access files in your Google Drive while using R in Colab:

R
Copy code
# Install and load the googledrive package
install.packages("googledrive")
library(googledrive)

# Authenticate Google Drive
drive_auth()

# Specify file path in Google Drive
file <- drive_get("your_file_name.tab")

# Download the file to Colab's local storage
drive_download(file, path = "your_file_name.tab", overwrite = TRUE)

# Load the file
data <- read_delim("your_file_name.tab", delim = "\t")
