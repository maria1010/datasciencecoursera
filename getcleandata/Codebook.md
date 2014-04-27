Codebook for run_analysis.R
========================================================

The following describes the steps performed by the run_analysis.R script.

(Note: after downloading and extracting the zip file containing the dataset)

1) Read in the training and test data sets. Then, merge them as follows: measured values into variable X, labels into variable Y, and subjects into variable S. This is using read.table for reading a text file into a table; and rbind which means merge the data sets in rows. 

2) Read in the features text file using read.table and store them into variable features. Using grep, retrieve all the indices of the mean and standard deviation features and store them into variable use. Extract the mean and standard deviation measurements from X using the the computed indices and store them back into the variable X. Then, appropriately label the columns of X with the names found in the features variable (i.e. column 2, rows from variable use).

3-4) Read in the activities text file using read.table and store them in variable activities. Then, replace the numeric values in the activity column of Y with the associate descriptive activity name. Appropriately name the activity label data set column wiht "activity"

5) Appropriately name the columns for the subject data set with "subject". Then, prepare the data by combining the subject, label, and measured values using cbind. Reshape the data so that the average for each variable/activity/subject can be computed (on next line) using melt. Finally, compute the average for each variable/activity/subject using dcast. Save the results into a csv file called run_analysis_results.csv.