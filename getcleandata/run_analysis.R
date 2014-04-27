## You should create one R script called run_analysis.R that does 
## the following. 

library(reshape2)
library(plyr)

## -----------------------------------------------------------------------
## 1. Merges the training and the test sets to create one data set.

## merge the training and test measured data sets
traindata <- read.table("train/X_train.txt")
testdata <- read.table("test/X_test.txt")
X <- rbind(traindata, testdata)

## merge the training and test labels data sets
traindata <- read.table("train/Y_train.txt")
testdata <- read.table("test/Y_test.txt")
Y <- rbind(traindata, testdata)

## merge the training and test subject data sets
traindata <- read.table("train/subject_train.txt")
testdata <- read.table("test/subject_test.txt")
S <- rbind(traindata, testdata)

## -----------------------------------------------------------------------
## 2. Extracts only the measurements on the mean and standard 
## deviation for each measurement. 

## read in the features file
features <- read.table("features.txt")
## search for all the mean and standard deviation features by their indices
use <- grep("*std|mean*", features[[2]])
## extract the mean and standard deviation measurements using the computed
## indices in the previous line
X <- X[,use]
## appropriately label the column names of the measured values
colnames(X) <- features[use,2]

## -----------------------------------------------------------------------
## 3. Uses descriptive activity names to name the activities in 
## the data set
## 4. Appropriately labels the data set with descriptive activity 
## names. 

## the following lines are for 3 and 4
## read in the activities file and store on a table
activities <- read.table("activity_labels.txt")
## replace the numeric values in the activity column with the associated
## descriptive activity name
Y[,1] <- activities[Y[,1], 2]
## appropriately name the activity label data set
colnames(Y) <- c("activity")

## -----------------------------------------------------------------------
## 5.Creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject. 

## appropriately name the columns for the subject data set
colnames(S) <- c("subject")
## prepares the data by combining the subject, label, and measured values
## arrange them in columns
data <- cbind(S, Y, X)
## reshape the data so that the average for each variable/activity/subject
## can be computed (on next line)
data <- melt(data, id=c("subject", "activity"), 
             measure.vars=colnames(data[,(ncol(S)+ncol(Y)+1):length(data)]))
## tidy data with computed average for each variable/activity/subject
data <- dcast(data, subject + activity ~ variable, mean)

## save the results into a csv file
write.csv(data, "run_analysis_results.csv")