
# ----- ASSIGNMENT 2 -------

#rm(list = ls())

getwd()

DEGs_Data_1 <- read.csv(file.choose())   
DEGs_Data_2 <- read.csv(file.choose())   

# Create Results folder if it doesn’t exist
if (!dir.exists("Results")) {
  dir.create("Results")
}


# Define classification function
classify_gene <- function(logFC, padj) {
  if (is.na(padj)) {
    padj <- 1
  }
  if (logFC > 1 & padj < 0.05) {
    return("Upregulated")
  } else if (logFC < -1 & padj < 0.05) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}


# Put both datasets in a list so we can loop
datasets <- list("DEGs_Data_1" = DEGs_Data_1,
                 "DEGs_Data_2" = DEGs_Data_2)


# Loop over datasets
for (name in names(datasets)) {
  df <- datasets[[name]]
  
  
  # Replace missing padj with 1
  df$padj[is.na(df$padj)] <- 1
  
  # Apply classification
  df$status <- mapply(classify_gene, df$logFC, df$padj)
  
  # Save processed file
  output_file <- paste0("Results/", name, "_processed.csv")
  write.csv(df, output_file, row.names = FALSE)
  
  # Print summary
  cat("\nSummary for:", name, "\n")
  print(table(df$status))
}



