Analysis on the Human Activity Recognition Using Smartphones Dataset
====================================================================

The run_analysis.R script performs an analysis on the Human Activity Recognition Using Smartphones Dataset found in:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

and downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

If you would like more information about the dataset, please got to the appropriate URLs (see above).

The run_analysis.R script creates a tidy data set containing all the training and test data. It stores ther results in the variable called "data" where the columns are as follows:
* Column 1: Subject number
* Column 2: Activity performed
* Columns 3-81: Average on each mean and standard deviations of measurements per subject per activity.

Results are saved in run_analysis_results.csv.

Note: The run_analysis.R script runs on R (or RStudio). Make sure that the extracted zip file is on the same working directory as the run_analysis.R script.