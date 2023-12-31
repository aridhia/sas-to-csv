# Load packages
library(data.table)
library(haven)
library(labelled)
library(tidyverse)
library(tools)

# Path to SAS file to be converted
file = "path/to/test.sas7bdat"

base = file_path_sans_ext(file)
extension = file_ext(file)

# Read in SAS file
if (extension == "sas7bdat") {
  df <- read_sas(file)
} else if (extension == "xpt") {
  df <- read_xpt(file)
}

# Select metadata columns
metadata <- df %>% look_for() %>% select(variable, label, col_type)
# Rename columns
metadata <- metadata %>% rename(name = variable, type = col_type)
# Change type chr to text and dbl to decimal
metadata <- metadata %>% mutate(type = replace(type, type == "chr", "text"))
metadata <- metadata %>% mutate(type = replace(type, type == "dbl", "decimal"))
# Change type of columns all ending on "DTC" to date
# This assumes that all date columns in SDTM end on "DTC"
metadata <- metadata %>% mutate(type = replace(type, name %like% ("DTC$"), "date"))

# Write data and metadata to CSV files
write.csv(df, paste(base, "_data.csv", sep=""), row.names=FALSE)
write.csv(metadata, paste(base, "_metadata.csv", sep=""), row.names=FALSE)
