# Assignment for Getting and Cleaning Data

This script file (run_analysis.R) has two functions to run the analysis on the provided files

a. Function get_dataset(setType)
   Summary: This function reads the X, Y, Subject data from files, merges them and returns back
   Arguments: setType is used to specify the kind of Data Set - Train/Test
   Notes: The file names for the provided setType are built automatically
   
   The Steps performed in the function are given below
   1. This function loads the X Set, Y Set and the Subject data from the provided files
   2. Assigns Activity Label from Y Set to the new column called ActivityLabel in X Set
   3. Assigns Subject Label from subject data to the new column called Subject in X Set
      returns the combined Set data frame
   
b. Function run_analysis()
   Summary: This function merges the data from training and test sets. Extracts the needed columns
            Run analysis and Writes the result to a txt file
   
   The Steps performed in the function are given below.
   1. Load required libraries
   2. Read Activity Labels, Features, Testsets and their labels
   3. Merge test and train sets
   4. Filter columns that has only mean or std
   5. Assign column names to the test set
   6. Merge with Activity Labels data frame to get meaningful activity description
   7. Group the data set by Activity and Subject and then Calculate mean for each variable within each group
   8. Write the result to a txt file
   
