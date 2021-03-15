# Getting and Cleaning Data Course Project Code Book

In this assigment we have created a script that does the following:

## Dataset

The dataset used in this assigment is taken from the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
   
A full description of the dataset is available here:
   
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data from this dataset contains data about experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset includes the following files:

- 'features.txt': List of all features.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## Actions

The script does the following transformations on the dataset:

1. Merges the subjects, the activities, the training dataset and the test dataset to create one data set with the name "merged_test_dataset".

2. Extracts only the measurements on the mean and standard deviation for each measurement, from the columns that contains "mean" or "std", together with the subjects and the activities. 

3. Uses descriptive activity names to name the activities in the data set with the following transformations:

* Replaces "-" by white spaces
* Removes parenthesis
* Replaces "t" with time and "f" with frequency
* Replaces "acc" with "acceleration" and "mag" with magnitude
* Add appropiate white spaces

4. Appropriately labels the data set with descriptive variable names using the file with activity names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script

The script is available in a file with the name "run_analysis.R" and the results have been saved into a file with the name "final_dataset.txt". 