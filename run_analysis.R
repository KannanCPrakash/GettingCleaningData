run_analysis <- function()
{
  library(dplyr)
  ## This code assumes that all files are available in data directory 
  ## under current working directory
  
  ## Read Activity Labels
  activityLabels <- read.table("./data/activity_labels.txt")
  
  ## Read Features
  features <- read.table("./data/features.txt")

  ## Read Test Set and Labels
  test_set <- get_dataset("test")
  
  ## Read Train Set and Labels
  train_set <- get_dataset("train")
  
  ## 1. Merge the training and the test sets to create one data set
  full_set <- rbind(test_set, train_set)
  
  ## Add Activity Label and Subject to the feature
  features<-rbind(features, data.frame(V1=nrow(features)+1,V2="ActivityLabel"))
  features<-rbind(features, data.frame(V1=nrow(features)+1,V2="Subject"))

  ## 2. Extract only the measurements on the mean and standard deviation for each measurement   
  ## Also Adding ActivityLabel and Subject to the filter
  ## Filter features which has mean or std
  features <- features[grepl('mean|std|ActivityLabel|Subject',features[,2]), ]

  ## Extract test set which has only mean or std
  full_set <- full_set[ ,features[,1]]

  ## 4. Appropriately label the data set with descriptive variable names
  ## Update column names with descriptive variable names
  colnames(full_set) <- features[,2]
  
  ## 3. Uses descriptive activity names to name the activities in the data set
  ## Give meaningful names to activity labels data frame
  activityLabels <- rename(activityLabels, ID=V1, Activity=V2)
  
  ## Merge with Activity labels to get the activity
  full_set <- merge(full_set, activityLabels, by.x = "ActivityLabel", by.y ="ID")

  ## Delete Activity Label Column
  full_set <- full_set[, !(colnames(full_set) %in% c("ActivityLabel"))]
  
  ## 5. From the data in step 4, creates a second, independent tidy data set with the average of each variable
  ##    for each activity and each subject
  full_set <- full_set %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
  
  ## Write table to a txt file
  write.table(full_set, file = "result.csv", row.names = FALSE)
}

get_dataset <- function(setType){
  ## Read Data Set and Labels
  set_X <- read.table(gsub("!!",setType,"./data/!!/X_!!.txt"))
  set_Y <- read.table(gsub("!!",setType,"./data/!!/Y_!!.txt"))
  subject <- read.table(gsub("!!",setType,"./data/!!/subject_!!.txt"))
  
  ## Get Activity label from Y and assign it to a new Column in X 
  set_X["ActivityLabel"] <- set_Y[1]
  
  ## Add a new column from the subject to get the subject id
  set_X["Subject"] <- subject[1]
  
  set_X
}
