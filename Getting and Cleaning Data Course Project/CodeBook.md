## Code Book

| Variable Name | Format | Description |
| --- | --- | --- |
| `path` | character | path where the UCI HAR Dataset folder is located |
| `activity_labels` | data.frame | labels of the activities |
| `features` | data.frame | the features selected for this database |
| `row` | character | in this variable each row of the file is saved without double spaces |
| `vrow` | character vector | a vector is created by splitting the string by single space |
| `subject_test` | data.frame | the test set is saved per subject |
| `X_test_tmp` | data.frame | an empty data frame is created with all the features as columns |
| `X_test` | data.frame | is the resulting data set after organizing the data for the test set |
| `subject_train` | data.frame | the train set is saved per subject |
| `X_train_tmp` | data.frame | an empty data frame is created with all the features as columns |
| `X_train` | data.frame | is the resulting data set after organizing the data for the train set |
| `result` | data.frame | merges the training and the test sets to create one data set |
| `mean_std_result_set` | data.frame | extracts only the measurements on the mean and standard deviation for each measurement |
| `mean_all_result_set` | data.frame | tidy data set with the average of each variable for each activity and each subject |