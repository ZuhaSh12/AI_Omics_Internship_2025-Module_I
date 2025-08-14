gene <- "TP53"
print(gene)

# Store numeric values in one variable (vector)
expression_levels <- c(2.3, 4.6, 3.6, 7.2, 4.7)

# Import a CSV file as a variable
raw_data <- read.csv(file.choose())
raw_data

# Must start with a letter
# 1gene <- 25  # Invalid, starts with a number
gene1 <- 25    # Valid, number at the end

# Use underscore (_) or dot (.) instead
sample_id <- "s01"
sample.id <- "s02"


# R is case-sensitive
Glucose_level <- 110
glucose_level <- 110  # Treated as a different variable


# Variables can be overwritten without warning
glucose_level <- c(110, 90, 120)


# First create a copy of raw_data to preserve the original data set
data <- raw_data


# Remove the 'patient_id' column from the original raw_data
# This overwrites raw_data permanently, and the column cannot be restored
# unless a copy (like 'data') was created beforehand
raw_data$patient_id <- NULL

# Alternatively, create a new dataset without the first column
# This keeps the original 'data' intact and stores the modified version in clean_data
clean_data <- data[, -1]


# --------------------------------------------------------------------------------------------------

#### Sorting Data with TRUE & FALSE keywords ####

# Sort 'age' from largest to smallest
sorted_age <- sort(raw_data$age, decreasing = TRUE)
sorted_age

# Sort 'age' from smallest to largest
sorted_age2 <- sort(raw_data$age, decreasing = FALSE)
sorted_age2

# TRUE and FALSE are logical constants in R
# They are written in uppercase without quotation marks

# --------------------------------------------------------------------------------------------------

#### if & else: Logical Conditions ####

gene_expression <- 30

# if statement:
# Executes the code inside the curly braces only if the condition is TRUE
# Here, the condition checks if gene_expression is greater than 50

# If TRUE, prints the message "Gene is highly expressed"
if (gene_expression > 30) {
  print("Gene is highly expressed")
}

# If FALSE, nothing happens because there is no else block
if (gene_expression > 50) {
  print("Gene is highly expressed")
}

# if-else statement:
# Executes the first block if the condition is TRUE
# If the condition is FALSE, executes the code in the else block

if (gene_expression > 50) {
  print("Gene is highly expressed")
} else {
  print("Gene expression is low")
}

# Invalid: cannot use 'if' as a variable name
# if <- 28



#### for Loop: Automating Tasks ####


# Example: convert character columns to factors

# Check structure of raw_data
str(raw_data)

# Create a copy to avoid modifying the original data
clean_data <- raw_data
str(clean_data)

# Convert all character columns to factors
# Loop through each column of clean_data using its index (i)
for (i in 1:ncol(clean_data)) {
  if (is.character(clean_data[[i]])) {
    clean_data[[i]] <- as.factor(clean_data[[i]])
  }
}


##Check Cholesterol level (using if) 

cholesterol <- 230

if (cholesterol > 240) {
  print("High Cholesterol")
}


# 2. Blood Pressure Status (using if...else)

Systolic_bp <- 130

if (Systolic_bp < 120) {
  print("Blood Pressure is normal")
} else {
  print("Blood Pressure is high")
}




# ----------------------------------------------------------------------------------------------------------------
# 3. Automating Data Type Conversion with for loop

# Load data sets
# Import a CSV file as a variable
patient_info <- read.csv(file.choose())
metadata <- read.csv(file.choose())

# Create copies
patient_copy <- patient_info
metadata_copy <- metadata

# Identify factor columns for patient_info
factor_cols_patient <- c("gender", "smoking_status")   # example names
# Convert columns to factors
for (col in factor_cols_patient) {
  patient_copy[[col]] <- as.factor(patient_copy[[col]])
}

# Identify factor columns for metadata
factor_cols_meta <- c("variable_type", "category")     # example names
# Convert columns to factors
for (col in factor_cols_meta) {
  metadata_copy[[col]] <- as.factor(metadata_copy[[col]])
}

# ----------------------------------------------------------------------------------------------------------------

# 4. Converting Factors to Numeric Codes

# Example: On patient_copy data set
binary_cols <- c("smoking_status")   # store column names in a vector

for (col in binary_cols) {
  patient_copy[[col]] <- ifelse(patient_copy[[col]] == "Yes", 1, 0)
}

# ----------------------------------------------------------------------------------------------------------------



# ----------------------------------------------------------------------------------------------------------------
# Verification: Compare structures before and after

cat("Original Patient Info Structure:\n")
str(patient_info)

cat("\nModified Patient Copy Structure:\n")
str(patient_copy)

cat("\nOriginal Metadata Structure:\n")
str(metadata)

cat("\nModified Metadata Copy Structure:\n")
str(metadata_copy)








