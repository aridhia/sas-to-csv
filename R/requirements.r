# Packages used by the script
packages <- c("data.table", "haven", "labelled", "tidyverse", "tools")

# Install the packages if not installed
if (!require(packages)){
  install.packages(packages)
}