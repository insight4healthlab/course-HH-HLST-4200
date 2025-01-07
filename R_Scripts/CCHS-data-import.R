# Specify the file path
file_path <- "~/Desktop/CCHS/cchs-82M0013-E-2017-2018-Annual-component_F1-subset.tab"

if (file.exists(file_path)) {
  data <- read.table(file_path, header = TRUE, sep = "\t")
  head(data)
} else {
  stop("The file does not exist. Check the file path.")
}
