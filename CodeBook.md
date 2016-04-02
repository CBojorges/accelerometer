#CodeBook

The original data was obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
To replicate the data stored in the [accelerometer repository](https://github.com/CBojorges/accelerometer), you have to first download the data using the [download.R](https://github.com/CBojorges/accelerometer/blob/master/download.R) script.
This script will download the data in the current working directory. Once the data has been downloaded, run the [run_analysis.R](https://github.com/CBojorges/accelerometer/blob/master/run_analysis.R) script.
The [run_analysis.R](https://github.com/CBojorges/accelerometer/blob/master/run_analysis.R) script does the following transformations:

#Transformations
1.Read the data previously downloaded.
2.Rename the variables and observations.
3.Merge the "test" and "training" datasets.
4.Extract a new data frame with the variables which contains the words: "type", "activity", "mean" or "std".
5.Save the data frame generated from (4) in an [accelerometerData.RData](https://github.com/CBojorges/accelerometer/blob/master/accelerometerData.RData) file and export it to an [accelerometerData.csv](https://github.com/CBojorges/accelerometer/blob/master/accelerometerData.csv) file. 
6.Calculate the means of each variable and create a new data frame with it. 
7.Save the resulting data frame to a [means.RData](https://github.com/CBojorges/accelerometer/blob/master/means.RData) file and export it to a [means.csv](https://github.com/CBojorges/accelerometer/blob/master/means.csv).   

#Variables
The variables from the [original data set]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are:

*Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*Triaxial Angular velocity from the gyroscope. 
*A 561-feature vector with time and frequency domain variables. 
*Its activity label. 
*An identifier of the subject who carried out the experiment.

The variables from the tidy data set ([acccelerometerData.RData](https://github.com/CBojorges/accelerometer/blob/master/accelerometerData.RData)) are:
*Subject: train or test.
*Activity: walking, walking_upstairs, walking_downstairs, sitting, standing and laying.
*The other variables are the measurements from the accelerometers.

The variables for the [means.RData](https://github.com/CBojorges/accelerometer/blob/master/means.RData) are: 
*Activity: walking, walking_upstairs, walking_downstairs, sitting, standing and laying.
*Subject: train or test.
*Means: these are the mean value of each measurement. 
