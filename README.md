Getting and Cleaning Data
-------------------------

## Course Project

run\_analysis.R includes a runnable method `run_analysis()`. It generates a dataset based on a [Human Activity Recognition Dataset Version 1.0](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

To produce this smaller dataset from the original, simply call `run_analysis()`. If a "UCI HAR Dataset" directory does not exist, the method downloads the [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the current working directory and unzips it to a "UCI HAR Dataset"" directory. It then proceeds to read the data and turn it into a smaller tidy dataset that summarizes the mean and standard deviation values from the accelerometer and gyro data from the original dataset by computing a mean value for each subject and activity combination.

See the CodeBook.md file for further description of the output dataset and the transformations applied to original data to obtain the summary data.
