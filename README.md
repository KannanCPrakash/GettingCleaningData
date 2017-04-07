# Assignment for Getting and CleaningData

This script file has two functions to run the analysis on the provided files

1. Function get_dataset(setType)
   SetType is used to specify the kind of Data Set - Train/Test
   The file names for the provided setType are built automatically
   This function loads the X Set, Y Set and the Subject data from the provided files
   Assigns Activity Label from Y Set to the new column called ActivityLabel in X Set
   Assigns Subject Label from subject data to the new column called Subject in X Set
   returns the combined Set data frame
   
2. Function run_analysis()
   This function merges the data from training and test sets. Extracts the needed columns
   Run analysis and Writes the result to a txt file
