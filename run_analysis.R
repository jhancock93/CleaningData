## Put comments here that give an overall description of what your
## functions do

#downloads and unzips the HAR dataset to the "UCI HAR Dataset" directory if the directory does not exist
get_har_data <- function()
{
    if (!file.exists("UCI HAR Dataset"))
    {
        if (!file.exists("UCI_HAR_Data.zip"))
            download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_HAR_Data.zip")
        unzip("UCI_HAR_Data.zip")
    }
}

## run_analysis takes the data set contained in the dataset, labels it
## removes unwanted columns, and computes the mean for the remaining columns
## grouped by subject and activity
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
    
    featureNames = features$V2
    
    ## Apply the feature names to the columns on trainx and testx sets
    colnames(trainx) <- featureNames
    colnames(testx) <- featureNames
    
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
    
    #remove the columns with duplicate names. We don't need them anyway and they cause problems in the select
    alldata = alldata[,!duplicated(colnames(alldata))]
    
    # now, select only the columns we need, the subject, the activity, and columns with "mean" or "std" in the name
    subdata = select(alldata, matches("(subject)+|(activity)+|(mean\\(\\))+|(std\\(\\))+", ignore.case = FALSE))
    
    #remove punctuation characters in feature names
    featureNames = gsub("[[:punct:]]", "", colnames(subdata))
    colnames(subdata) <- featureNames
    
    ## Use merge to add an activity name to the combined data frame
    subdata = merge(subdata, activities, by="activity")

    grouped = group_by(subdata, subject, activityname)
    finalresults = summarise_each(grouped, funs(mean))
}

# This produces information about each of the features in the resultant dataset
generate_featuregroups_for_codebook <- function(data) {
    labels = colnames(data)
    glabels = substr(labels, 1, nchar(labels) - 1)
    labeldata = data.frame(cbind(labels, glabels))
    labeldata$labels = as.character(labeldata$labels)
    labeldata$glabels = as.character(labeldata$glabels)
    labelgroups = group_by(labeldata, glabels)
}

# This produces a markdown-compatible list of feature names in the dataset
generate_featurelist_for_codebook <- function(data) {
    labelgroups = generate_featuregroups_for_codebook(data)
    fgs = summarize(labelgroups, features = paste(labels, sep = "", collapse = ", "), count = n())
    cat(fgs$features, sep = "  \n * ")
}
