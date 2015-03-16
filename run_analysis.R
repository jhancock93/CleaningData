## Put comments here that give an overall description of what your
## functions do


get_har_data <- function()
{
    if (!file.exists("UCI HAR Dataset"))
    {
        if (!file.exists("UCI_HAR_Data.zip"))
            download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_HAR_Data.zip")
        unzip("UCI_HAR_Data.zip")
    }
}

## run_analysis takes the data set contained in the dataset and cleans it up
run_analysis <- function() {
    library(dplyr)
    get_har_data()
    setwd("UCI HAR Dataset") # set the working directory to the UCI HAR Dataset
    trainx = read.table("train\\X_train.txt")
    trainsubject = read.table("train\\subject_train.txt")
    trainy = read.table("train\\Y_train.txt")
    testx = read.table("test\\X_test.txt")
    testy = read.table("test\\Y_test.txt")
    testsubject = read.table("test\\subject_test.txt")
    activities = read.table("activity_labels.txt")
    features = read.table("features.txt")
    setwd("..") #after reading the files, set the working directory back to the original
    
    ## Apply the feature names to the columns on trainx and testx sets
    colnames(trainx) <- features$V2
    colnames(testx) <- features$V2
    
    ## Give appropriate column names to the activities frame
    colnames(activities) <- c("activity", "activityname")
    
    ## Add an activity column to the train and test sets
    trainx$activity = trainy$V1
    testx$activity = testy$V1
    
    ## Add a subject column to the train and test sets
    trainx$subject = trainsubject$V1
    testx$subject = testsubject$V1
    
    ## Append the test set to the training set and put it in alldata
    alldata = rbind(trainx, testx)
    
    ## Use merge to add an activity name to the combined data frame
    alldata = merge(alldata, activities, by="activity")
    
    #subdata = select(alldata, subject, activity, #)
    subact = group_by(alldata, subject, activity)
    ##summarize(subact, )
    
    ##colMeans(subact)
}

