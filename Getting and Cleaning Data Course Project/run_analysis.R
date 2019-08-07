run_analysis <- function (){
  # The working directory must contain the UCI HAR Dataset folder 
  path <- paste(getwd(),"/UCI HAR Dataset", sep = "")
  
  activity_labels<- read.delim(paste(path,"/activity_labels.txt",sep = ""),header = FALSE, sep = " ")
  features<- read.delim(paste(path,"/features.txt",sep = ""),header = FALSE, sep = " ")
  
  #test set
  
  subject_test<- read.delim(paste(path,"/test/subject_test.txt",sep = ""),header = FALSE, sep = " ")
  
  #we return the file line by line to be able to remove the double spaces
  X_test_tmp <- read.delim(paste(path,"/test/X_test.txt",sep = ""),header = FALSE, sep = "\n")
  
  # an empty dataframe is created
  X_test <- setNames(data.frame(matrix(ncol = nrow(features), nrow = 0)), features$V2)
  
  #first row
  row <- gsub("  "," ",X_test_tmp[1,1])
  vrow <- unlist(strsplit(row," "))
  X_test[1, ] <- as.double(vrow[2:length(vrow)])
  
  #each row is read
  for(x in 2:nrow(X_test_tmp)){
    #double spaces are replaced by simple ones
    row <- gsub("  "," ",X_test_tmp[x,1])
    #a vector is created by splitting the string
    vrow <- unlist(strsplit(row," "))
    #the dataframe is filled row by row
    X_test<-rbind(X_test,as.double(vrow[2:length(vrow)]))
  }
  
  
  y_test<- read.delim(paste(path,"/test/y_test.txt",sep = ""),header = FALSE, sep = " ")
  
  #activity column is created
  X_test <- cbind(X_test,activity = y_test$V1)
  
  #the subject column is created
  X_test <- cbind(X_test,subject = subject_test$V1)
  
  #the set column is created
  X_test <- cbind(X_test, set = "test")
  
  #training set
  
  subject_train<- read.delim(paste(path,"/train/subject_train.txt",sep = ""),header = FALSE, sep = " ")
  
  #we return the file line by line to be able to remove the double spaces
  X_train_tmp <- read.delim(paste(path,"/train/X_train.txt",sep = ""),header = FALSE, sep = "\n")
  
  # an empty dataframe is created
  X_train <- setNames(data.frame(matrix(ncol = nrow(features), nrow = 0)), features$V2)
  
  #first row
  row <- gsub("  "," ",X_train_tmp[1,1])
  vrow <- unlist(strsplit(row," "))
  X_train[1, ] <- as.double(vrow[2:length(vrow)])
  
  #each row is read
  for(x in 2:nrow(X_train_tmp)){
    #double spaces are replaced by simple ones
    row <- gsub("  "," ",X_train_tmp[x,1])
    #a vector is created by splitting the string
    vrow <- unlist(strsplit(row," "))
    #the dataframe is filled row by row
    X_train<-rbind(X_train,as.double(vrow[2:length(vrow)]))
  }
  
  y_train <- read.delim(paste(path,"/train/y_train.txt",sep = ""),header = FALSE, sep = " ")
  
  #activity column is created
  X_train <- cbind(X_train,activity = y_train$V1)
  
  #the subject column is created
  X_train <- cbind(X_train,subject = subject_train$V1)
  
  #the subject column is created
  X_train <- cbind(X_train, set = "train")
  
  
  #result set -> test - train
  
  #1. Merges the training and the test sets to create one data set.
  result <- join_all(list(X_test,X_train),type = "full")
  
  #2. Extracts only the measurements on the mean and standard deviation for each measurement.
  result <- result %>% select(set,subject,activity,matches("mean|std"))
  
  #3. Uses descriptive activity names to name the activities in the data set
  for(x in 1:nrow(activity_labels)){
    result$activity[as.numeric(result$activity) ==as.numeric(activity_labels[x,1])] <- as.character(activity_labels[x,2])
  }
  
  #4. Appropriately labels the data set with descriptive variable names.
  mean_std_result_set <- result
  
  #5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  mean_all_result_set <- mean_std_result_set %>% select(-contains("set")) %>% group_by(activity, subject) %>% summarise_all(list(mean))
  
  mean_all_result_set
  
}