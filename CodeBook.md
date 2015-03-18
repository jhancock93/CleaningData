CodeBook
========

run\_analysis.R includes a runnable method `run_analysis()`. It performs the following operations:  

1.  If a "UCI HAR Dataset" directory does not exist, the method downloads the [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzips it to that directory. More information about the data set can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  
2.  Reads multiple files from the dataset directory  
3.  Concatenates the training and test datasets  
4.  Creates a 'subject' column in the dataset that contains the corresponding test subject using the data in subject_train.txt and subject_text.txt  
5. Uses the features.txt file to generate column labels for the dataset.   Adjacent parenthesis pairs are removed from the feature names and remaining punctuation symbols are replaced with underscores.  
6. Measurement columns without "mean" or "std" (case-insensitive) in the column names are discarded.  
7. An activity_name column is added to the dataset that correlates the measurement with the subject's current activity.  
8. Finally, the resultant measurements were grouped by subject and activity and a mean was computed for each column for each group, resulting in 180 rows.  

### The final data set contains the following columns:  

#### The metadata columns:  
* subject - The integer id of the subject  
* activity - The integer id of the activity  
* activity_name - The name of the activity  

#### The measurement columns:

* tBodyAcc_mean_X, tBodyAcc_mean_Y, tBodyAcc_mean_Z  
* tBodyAcc_std_X, tBodyAcc_std_Y, tBodyAcc_std_Z 
* tGravityAcc_mean_X, tGravityAcc_mean_Y, tGravityAcc_mean_Z  
* tGravityAcc_std_X, tGravityAcc_std_Y, tGravityAcc_std_Z  
* tBodyAccJerk_mean_X, tBodyAccJerk_mean_Y, tBodyAccJerk_mean_Z  
* tBodyAccJerk_std_X, tBodyAccJerk_std_Y, tBodyAccJerk_std_Z  
* tBodyGyro_mean_X, tBodyGyro_mean_Y, tBodyGyro_mean_Z    
* tBodyGyro_std_X, tBodyGyro_std_Y, tBodyGyro_std_Z                
* tBodyGyroJerk_mean_X, tBodyGyroJerk_mean_Y, tBodyGyroJerk_mean_Z 
* tBodyGyroJerk_std_X, tBodyGyroJerk_std_Y, tBodyGyroJerk_std_Z          
* tBodyAccMag_mean
* tBodyAccMag_std              
* tGravityAccMag_mean
* tGravityAccMag_std           
* tBodyAccJerkMag_mean
* tBodyAccJerkMag_std          
* tBodyGyroMag_mean
* tBodyGyroMag_std             
* tBodyGyroJerkMag_mean         tBodyGyroJerkMag_std         
* fBodyAcc_mean_X               fBodyAcc_mean_Y              
 fBodyAcc_mean_Z               fBodyAcc_std_X               
 fBodyAcc_std_Y                fBodyAcc_std_Z               
 fBodyAcc_meanFreq_X           fBodyAcc_meanFreq_Y          
 fBodyAcc_meanFreq_Z           fBodyAccJerk_mean_X          
 fBodyAccJerk_mean_Y           fBodyAccJerk_mean_Z          
 fBodyAccJerk_std_X            fBodyAccJerk_std_Y           
 fBodyAccJerk_std_Z            fBodyAccJerk_meanFreq_X      
 fBodyAccJerk_meanFreq_Y       fBodyAccJerk_meanFreq_Z      
 fBodyGyro_mean_X              fBodyGyro_mean_Y             
 fBodyGyro_mean_Z              fBodyGyro_std_X              
 fBodyGyro_std_Y               fBodyGyro_std_Z              
 fBodyGyro_meanFreq_X          fBodyGyro_meanFreq_Y         
 fBodyGyro_meanFreq_Z          fBodyAccMag_mean             
 fBodyAccMag_std               fBodyAccMag_meanFreq         
 fBodyBodyAccJerkMag_mean      fBodyBodyAccJerkMag_std      
 fBodyBodyAccJerkMag_meanFreq  fBodyBodyGyroMag_mean        
 fBodyBodyGyroMag_std          fBodyBodyGyroMag_meanFreq    
 fBodyBodyGyroJerkMag_mean     fBodyBodyGyroJerkMag_std     
 fBodyBodyGyroJerkMag_meanFreq activityname  

From the original features_info.txt that came from the data set, we describe the columns:

* mean: Mean value  
* std: Standard deviation  
* angle: Angle between two vectors  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

