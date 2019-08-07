## Getting and Cleaning Data Course Project
### How the script works

* The working directory must contain the UCI HAR Dataset folder. (wd --> UCI HAR Dataset folder)

```
The script loads the activity_labels.txt and features.txt files into the activity_labels and features variables, respectively, as data frame.
After this it start ordering the data sets for test and train.

First start with the data set for test.
1. the subject_test.txt file is loaded into the subject_test variable, such as dataframe
2. it return the file line by line to be able to remove the double spaces and save the result in the variable X_test_tmp
3. an empty dataframe is created and save in the variable X_test
4. a first row is added to X_test
5. all rows of X_test_tmp are readed and added to X_test
6. activity column is created
7. the subject column is created
8. the set column is created

points 6 and 7 will serve to make the grouping and thus be able to obtain the average

First start with the data set for train.
1. the subject_train.txt file is loaded into the subject_train variable, such as dataframe
2. it return the file line by line to be able to remove the double spaces and save the result in the variable X_train_tmp
3. an empty dataframe is created and save in the variable X_train
4. a first row is added to X_train
5. all rows of X_train_tmp are readed and added to X_train
6. activity column is created
7. the subject column is created
8. the set column is created

points 6 and 7 will serve to make the grouping and thus be able to obtain the average

```