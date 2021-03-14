# Getting and Cleaning Data Course Project

In this assigment we have created a script that does the following:

1. Downloads a dataset from the following URL:

   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

2. Merges the subjects, the activities, the training dataset and the test dataset to create one data set with the name "merged_test_dataset".

3. Extracts only the measurements on the mean and standard deviation for each measurement, from the columns that contains "mean" or "std", together with the subjects and the activities. 

4. Uses descriptive activity names to name the activities in the data set with the following transformations:

* Replaces "-" by white spaces
* Removes parenthesis
* Replaces "t" with time and "f" with frequency
* Replaces "acc" with "acceleration" and "mag" with magnitude
* Add appropiate white spaces

5. Appropriately labels the data set with descriptive variable names using the file with activity names. 

6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script is available in a file with the name "run_analysis.R" and the results have been saved into a file with the name "final_dataset.txt". 