CodeBook
========

run\_analysis.R includes a runnable method `run_analysis()`. It generates a dataset based on a [Human Activity Recognition Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Documentation from the original data set states:

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

Multiple variable types were estimated from those signals. The subset of the data included in this project on include mean and standard deviation values. 

To produce this smaller dataset from the original, `run_analysis()` performs the following operations:  

1.  If a "UCI HAR Dataset" directory does not exist, the method downloads the [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzips it to that directory.  
2.  Reads multiple files from the dataset directory  
3.  Concatenates the training and test datasets  
4.  Creates a 'subject' column in the dataset that contains the corresponding test subject using the data in subject_train.txt and subject_text.txt  
5. Uses the features.txt file to generate column labels for the dataset.   Adjacent parenthesis pairs are removed from the feature names and remaining punctuation symbols are replaced with underscores.  
6. Because the assignment indicates that only the mean and standard deviation measurements should be kept, measurement columns without "mean()" or "std()" (case-insensitive) in the column names are discarded.  
7. An activity_name column is added to the dataset that correlates the measurement with the subject's current activity.  
8. Finally, the resultant measurements were grouped by subject and activity and a mean was computed for each column for each group, resulting in 180 rows.  

### The final data set contains the following columns:  

#### The metadata columns:  
* subject - The integer id of the subject  
* activity - The integer id of the activity  
* activity_name - The name of the activity  

#### The columns containing the mean of each of the original variables per subject and activity:
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


