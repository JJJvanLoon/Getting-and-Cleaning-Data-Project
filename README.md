#Read Me
###Hi,
This is the README file for the course project for Getting and Cleaning Data, part of the data science specialization on coursera.

This repository consists of the following files:

*this README.md file
*a codebook.md
*a run_analysis.R script and 
*a tidyset.txt file describing the average values of the tidy dataset. 

### Data

This project uses data from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###The following information is copied from the README.txt file from the data:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:

> * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> * Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

## The course project:

### You should create one R script called run_analysis.R that does the following.
(1) Merges the training and the test sets to create one data set.
(2) Extracts only the measurements on the mean and standard deviation for each measurement. 
(3) Uses descriptive activity names to name the activities in the data set
(4) Appropriately labels the data set with descriptive variable names. 
(5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The script

This script assumes that the run_analysis.R script and the unzipped data folder are both in your working directory. The individual datafiles do not have to be relocated to the working directory, the script will find them. 

Entering the following command will start the script:

        source("run_analysis.R")

* The script uses the dplyr package, this will install and load if needed. 
* The script will then import the x, y, and subject data from the test and train folders and bind them into three data frames. 
* The colomns of the data frames will be given the correct names.
* Duplicated colomns will be removed. 
* All the colomns from the x data describing mean and standard deviation data will be selected and merged with the y data and the subject data.
* The activities will be given a discriptive name by transforming the activities colomn into a factor.
* From this tidy dataset a new dataset is produced. This new dataset contains all average values for the observed variables for every combination of subject and activity. This set is 180 observations by 88 variables.
* This summarized dataset is written to a txt file called tidyset.txt, identical to the one included into this repository. 

This file can be read into R using the following command:

        tidyset <- tbl_df(read.table("tidyset.txt", header = TRUE))

tbl_df handles printing well, the entire dataset can best be viewed with the following command:

        View(tidyset)
 
 
### Sources:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012