CodeBook
========

run_analysis.R includes a runnable method run_analysis(). It performs the following operations:  
* If a "UCI HAR Dataset" directory does not exist, downloads file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzips it to that directory.  
* Reads multiple files from the dataset directory  
* Concatenates the training and test datasets  
* Creates a 'subject' column in the dataset that contains the corresponding test subject using the data in subject_train.txt and subject_text.txt  
* Uses the features.txt file to generate column labels for the dataset.   Adjacent parenthesis pairs are removed from the feature names and remaining punctuation symbols are replaced with underscores.  
* Measurement columns without "mean" or "std" (case-insensitive) in the column names are discarded.  
* An activity_name column is added to the dataset that correlates the measurement with the subject's current activity.  
* Finally, the resultant measurements were grouped by subject and activity and a mean was computed for each column for each group, resulting in 180 rows.  

## The final data set contains the following columns:  

### The metadata columns:  
* subject - The integer id of the subject  
* activity - The integer id of the activity  
* activity_name - The name of the activity  

### The measurement columns:

[3] "tBodyAcc_mean_X"               "tBodyAcc_mean_Y"              
 [5] "tBodyAcc_mean_Z"               "tBodyAcc_std_X"               
 [7] "tBodyAcc_std_Y"                "tBodyAcc_std_Z"               
 [9] "tGravityAcc_mean_X"            "tGravityAcc_mean_Y"           
[11] "tGravityAcc_mean_Z"            "tGravityAcc_std_X"            
[13] "tGravityAcc_std_Y"             "tGravityAcc_std_Z"            
[15] "tBodyAccJerk_mean_X"           "tBodyAccJerk_mean_Y"          
[17] "tBodyAccJerk_mean_Z"           "tBodyAccJerk_std_X"           
[19] "tBodyAccJerk_std_Y"            "tBodyAccJerk_std_Z"           
[21] "tBodyGyro_mean_X"              "tBodyGyro_mean_Y"             
[23] "tBodyGyro_mean_Z"              "tBodyGyro_std_X"              
[25] "tBodyGyro_std_Y"               "tBodyGyro_std_Z"              
[27] "tBodyGyroJerk_mean_X"          "tBodyGyroJerk_mean_Y"         
[29] "tBodyGyroJerk_mean_Z"          "tBodyGyroJerk_std_X"          
[31] "tBodyGyroJerk_std_Y"           "tBodyGyroJerk_std_Z"          
[33] "tBodyAccMag_mean"              "tBodyAccMag_std"              
[35] "tGravityAccMag_mean"           "tGravityAccMag_std"           
[37] "tBodyAccJerkMag_mean"          "tBodyAccJerkMag_std"          
[39] "tBodyGyroMag_mean"             "tBodyGyroMag_std"             
[41] "tBodyGyroJerkMag_mean"         "tBodyGyroJerkMag_std"         
[43] "fBodyAcc_mean_X"               "fBodyAcc_mean_Y"              
[45] "fBodyAcc_mean_Z"               "fBodyAcc_std_X"               
[47] "fBodyAcc_std_Y"                "fBodyAcc_std_Z"               
[49] "fBodyAcc_meanFreq_X"           "fBodyAcc_meanFreq_Y"          
[51] "fBodyAcc_meanFreq_Z"           "fBodyAccJerk_mean_X"          
[53] "fBodyAccJerk_mean_Y"           "fBodyAccJerk_mean_Z"          
[55] "fBodyAccJerk_std_X"            "fBodyAccJerk_std_Y"           
[57] "fBodyAccJerk_std_Z"            "fBodyAccJerk_meanFreq_X"      
[59] "fBodyAccJerk_meanFreq_Y"       "fBodyAccJerk_meanFreq_Z"      
[61] "fBodyGyro_mean_X"              "fBodyGyro_mean_Y"             
[63] "fBodyGyro_mean_Z"              "fBodyGyro_std_X"              
[65] "fBodyGyro_std_Y"               "fBodyGyro_std_Z"              
[67] "fBodyGyro_meanFreq_X"          "fBodyGyro_meanFreq_Y"         
[69] "fBodyGyro_meanFreq_Z"          "fBodyAccMag_mean"             
[71] "fBodyAccMag_std"               "fBodyAccMag_meanFreq"         
[73] "fBodyBodyAccJerkMag_mean"      "fBodyBodyAccJerkMag_std"      
[75] "fBodyBodyAccJerkMag_meanFreq"  "fBodyBodyGyroMag_mean"        
[77] "fBodyBodyGyroMag_std"          "fBodyBodyGyroMag_meanFreq"    
[79] "fBodyBodyGyroJerkMag_mean"     "fBodyBodyGyroJerkMag_std"     
[81] "fBodyBodyGyroJerkMag_meanFreq" "activityname"  

From the original features_info.txt that came from the data set, we describe the columns:
mean: Mean value
std: Standard deviation
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

