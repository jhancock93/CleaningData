CodeBook
========

run\_analysis.R includes a runnable method `run_analysis()`. It generates a dataset based on a [Human Activity Recognition Dataset Version 1.0](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The original data was collected by:

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Documentation from the original data set states:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:

> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Multiple variable types were estimated from those signals. The subset of the data included in the output dataset only includes mean and standard deviation values. 

To produce this smaller dataset from the original, `run_analysis()` performs the following operations:  

1.  If a "UCI HAR Dataset" directory does not exist, the method downloads the [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the current working directory and unzips it to a "UCI HAR Dataset"" directory.  
2.  Reads multiple files from the dataset directory  
3.  Concatenates the training and test datasets  
4.  Creates a 'subject' column in the dataset that contains the corresponding test subject using the data in subject_train.txt and subject_text.txt  
5. Uses the features.txt file to generate column labels for the dataset.   Adjacent parenthesis pairs are removed from the feature names and remaining punctuation symbols are replaced with underscores.  
6. Because the assignment indicates that only the mean and standard deviation measurements should be kept, measurement columns without "mean()" or "std()" (case-insensitive) in the column names are discarded.  
7. An activity_name column is added to the dataset that correlates the measurement with the subject's current activity.  
8. Finally, the resultant measurements were grouped by subject and activity and a mean was computed for each column for each group, resulting in 180 rows.

### The final data set contains the following columns:  

#### The metadata columns  
* subject - The integer id of the subject  
* activity - The integer id of the activity  
* activityname - The name of the activity. Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

#### Meausurement columns in the final dataset
Columns contains the mean value (grouped by subject and activity) of one of the mean or standard deviation variables in the original data set as described in the original data documentation. Columns with "mean" at the end of then name (possibly followed by X, Y, or Z) correspond to the mean values. Columns with "std" at the end of the name (possibly followed by X, Y, or Z) correspond to a value derived from standard deviation measurements:

 * fBodyAccJerkmeanX, fBodyAccJerkmeanY, fBodyAccJerkmeanZ  
 * fBodyAccJerkstdX, fBodyAccJerkstdY, fBodyAccJerkstdZ  
 * fBodyAccMagmean  
 * fBodyAccMagstd  
 * fBodyAccmeanX, fBodyAccmeanY, fBodyAccmeanZ  
 * fBodyAccstdX, fBodyAccstdY, fBodyAccstdZ  
 * fBodyBodyAccJerkMagmean  
 * fBodyBodyAccJerkMagstd  
 * fBodyBodyGyroJerkMagmean  
 * fBodyBodyGyroJerkMagstd  
 * fBodyBodyGyroMagmean  
 * fBodyBodyGyroMagstd  
 * fBodyGyromeanX, fBodyGyromeanY, fBodyGyromeanZ  
 * fBodyGyrostdX, fBodyGyrostdY, fBodyGyrostdZ   
 * tBodyAccJerkMagmean  
 * tBodyAccJerkMagstd  
 * tBodyAccJerkmeanX, tBodyAccJerkmeanY, tBodyAccJerkmeanZ  
 * tBodyAccJerkstdX, tBodyAccJerkstdY, tBodyAccJerkstdZ  
 * tBodyAccMagmean  
 * tBodyAccMagstd  
 * tBodyAccmeanX, tBodyAccmeanY, tBodyAccmeanZ  
 * tBodyAccstdX, tBodyAccstdY, tBodyAccstdZ  
 * tBodyGyroJerkMagmean  
 * tBodyGyroJerkMagstd  
 * tBodyGyroJerkmeanX, tBodyGyroJerkmeanY, tBodyGyroJerkmeanZ  
 * tBodyGyroJerkstdX, tBodyGyroJerkstdY, tBodyGyroJerkstdZ  
 * tBodyGyroMagmean  
 * tBodyGyroMagstd  
 * tBodyGyromeanX, tBodyGyromeanY, tBodyGyromeanZ  
 * tBodyGyrostdX, tBodyGyrostdY, tBodyGyrostdZ  
 * tGravityAccMagmean  
 * tGravityAccMagstd  
 * tGravityAccmeanX, tGravityAccmeanY, tGravityAccmeanZ  
 * tGravityAccstdX, tGravityAccstdY, tGravityAccstdZ


