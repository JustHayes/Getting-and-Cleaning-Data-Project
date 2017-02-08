#This is the CodeBook for the Getting and Cleaning Data week 4 project
  *data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  *data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Set
  *'activity_labels.txt' - includes class labels with activity names
  *'features.txt' - list of featurs
  *'features_info.txt' - information about the variables in the features
  *'README.txt' - original readme file
  *'test/subject_test.txt' - subject who performed the activity
  *'test/X_test.txt' - test data set
  *'test/X_test.txt' - test data labels
  *'train/subject_train.txt' - subject who performed the activity
  *'train/X_train.txt' - train data set
  *'train/X_train.txt' - train data labels
  
##Data transformations in 'run_analysis.R'
  *Merges the training and the test sets to create one data set.
  *Extracts only the measurements on the mean and standard deviation for each measurement.
  *Uses descriptive activity names to name the activities in the data set
  *Appropriately labels the data set with descriptive variable names.
  *From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
