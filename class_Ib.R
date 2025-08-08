subfolders <- c("raw_data", "clean_data", "scripts", "results", "plots", "tasks")
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")
dir.create("tasks")

file_path <- "raw_data/patient_info.csv"
patient_info <- read.csv(file_path, stringsAsFactors = FALSE)

head(patient_info)

str(patient_info)
summary(patient_info)

# patient_id → character
patient_info$patient_id <- as.character(patient_info$patient_id)

# gender & diagnosis → factors
patient_info$gender <- as.factor(patient_info$gender)
patient_info$diagnosis <- as.factor(patient_info$diagnosis)


# bmi → numeric
patient_info$bmi <- as.numeric(patient_info$bmi)

# smoker → factor
patient_info$smoker <- as.factor(patient_info$smoker)

head(patient_info)


# 4. Create Binary Smoking Variable
# -------------------------------
# 1 = Yes, 0 = No
patient_info$smoker_binary <- ifelse(tolower(patient_info$smoker) == "yes", 1, 0)

head(patient_info)



# 5. Save Cleaned Dataset
# -------------------------------
clean_data_path <- "clean_data/patient_info_clean.csv"
write.csv(patient_info, clean_data_path, row.names = FALSE)

message("Cleaned dataset saved to clean_data folder.")


getwd()  # shows current working directory
list.files()  # lists files/folders in the current directory

file.exists("clean_data/patient_info_clean.csv")

# Ensure folder exists
if (!dir.exists("clean_data")) dir.create("clean_data")

# Save file
write.csv(patient_info, "clean_data/patient_info_clean.csv", row.names = FALSE)

# Check if saved
file.exists("clean_data/patient_info_clean.csv")

list.files("scripts")








