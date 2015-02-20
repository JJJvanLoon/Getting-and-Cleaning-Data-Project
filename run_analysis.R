## This is a R script for the course project
## Getting and Cleaning Data 
## Part of the data science specialization on coursera

## the dplyr package is used, this will be installed if needed
require(dplyr)

##read csv files into a tbl_df (1)
X_data <- bind_rows(tbl_df(read.table("UCI HAR Dataset/test/X_test.txt")),tbl_df(read.table("UCI HAR Dataset/train/X_train.txt")))
subject <- bind_rows(tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt")),tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt")))
y_data <- bind_rows(tbl_df(read.table("UCI HAR Dataset/test/y_test.txt")),tbl_df(read.table("UCI HAR Dataset/train/y_train.txt")))

## label the data set variables (4)
names(X_data) <- read.table("UCI HAR Dataset/features.txt")[,2]
names(y_data) <- "Activities"
names(subject) <- "Subject"

## merging x, y and subject data into a complete set
complete <- bind_cols(subject,y_data,X_data)

## remove duplicated colomns
X_data_tidy <- X_data[,!duplicated(names(X_data))] 

## subsetting mean and standard deviation for each measurement (2)
X_data_tidy <- select(X_data_tidy,contains("std"),contains("mean"))

## merging x, y and subject data (1) 
tidy_large <- bind_cols(subject,y_data,X_data_tidy)

## transforming the activities colomn to a factor and naming the activities (3)
tidy_large[,2] <- factor(tidy_large[,2], labels = read.table("UCI HAR Dataset/activity_labels.txt")[,2])

## convert data.frame tidy_large into tbl_df for easy processing
tidy_large <- tbl_df(tidy_large)

## produce small tidy dataset with the average of each variable for each activity and each subject.
tidy_small <- tidy_large %>% 
        group_by(Subject, Activities) %>%
        summarise_each(funs(mean))
write.table(tidy_small,file = "tidyset.txt", row.name=FALSE)

print("The datasets are loaded, cleaned and merged.") 
print("The tidy dataset is stored in tidy_large")
print("the tidy dataset with the average of each variable for each activity and each subject is stored in tidy_small")
print("Thanks for your time.")
