##Original Data

Original data is accelerometer and 3-axial gyroscope raw signals from Samsung S2 smartphones. Detailed descriptions of the data and features can be found in the link provided here.

-[Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original dataset provided to students of the Coursera 'Getting and Cleaning Data' class can be found here.

-[Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Conventions

Processing code and dataset variable naming mostly follows the conventions described in the Google R Style Guide

##Data Set

The resulting data set is the average of all of the features from the raw dataset that were either a standard deviation or a mean value.
Variable names contain either a 'Mean' or a 'Std' depending on the type of the original feature. Names were also cleaned of unnecessary characters.
###For example:

Original Name       | New Name
--------------------|----------------------
'tBodyAcc-mean()-X' | 'tbodyAccMeanX'
'tBodyAcc-mean()-Y' | 'tbodyAccMeanY'
'tBodyAcc-std()-X'  | 'tbodyAccStdX'
'tBodyAcc-std()-Y'  | 'tbodyccStdY'

