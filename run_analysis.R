# We download the file with the train and test datasets
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

# We unzip the contents of the file
unzip(temp)

# We get the name of the features
features <- read.table("UCI HAR Dataset/features.txt")

# We read the content of the train and test datasets and merge each one of them
test_dataset <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt")

names(test_dataset) <- tolower(features$V2)
names(test_subjects) <- "subject"
names(test_activities) <- "activity"

merged_test_dataset <- cbind(test_subjects, test_activities, test_dataset)

train_dataset <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt")

names(train_dataset) <- tolower(features$V2)
names(train_subjects) <- "subject"
names(train_activities) <- "activity"

merged_train_dataset <- cbind(train_subjects, train_activities, train_dataset)

# We merge the training and test datasets
merged_datasets <- rbind(merged_test_dataset, merged_train_dataset)

# We get all the activities, subjects, means and standard deviations
filtered_dataset <- merged_datasets[, grep("activity|subject|mean|std", colnames(merged_datasets))]

# We add descritive names to the activities
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt")
filtered_dataset$activity <- as.factor(filtered_dataset$activity)
levels(filtered_dataset$activity) <- activity_names$V2

# We create descritive names for each column label
names(filtered_dataset) <- gsub("-", " ", names(filtered_dataset))
names(filtered_dataset) <- gsub("^t", "time domain ", names(filtered_dataset))
names(filtered_dataset) <- gsub("^f", "frequency domain ", names(filtered_dataset))
names(filtered_dataset) <- gsub("body\\s*", "body ", names(filtered_dataset))
names(filtered_dataset) <- gsub("gravity\\s*", "gravity ", names(filtered_dataset))
names(filtered_dataset) <- gsub("gyro\\s*", "gyro ", names(filtered_dataset))
names(filtered_dataset) <- gsub("jerk\\s*", "jerk ", names(filtered_dataset))
names(filtered_dataset) <- gsub("acc\\s*", "acceleration ", names(filtered_dataset))
names(filtered_dataset) <- gsub("mag\\s*", "magnitude ", names(filtered_dataset))
names(filtered_dataset) <- gsub(",\\s*", ", ", names(filtered_dataset))
names(filtered_dataset) <- gsub("\\(\\)", "", names(filtered_dataset))
names(filtered_dataset) <- gsub("\\s*\\)", ")", names(filtered_dataset))

# We calculate the average of each variable
filtered_dataset <- group_by(filtered_dataset, subject, activity) %>% summarize_each(c("mean"))

write.table(filtered_dataset, "final_dataset.txt", row.name=FALSE)