##Assumptions

1. Required Packages
	1. Data.Table
	2. Downloader (if you don't already have the data)
2. System
	1. This script was built on a Windows platform and has not been tested on other systems
	2. This script was developed in R version 3.1.1 and has not been tested on other systems

##Processing

1. User has option of setting 'getdata' variable to TRUE or FALSE
	1. If TRUE, then download and unzip the data
	2. If FALSE, assume data is alread downloaded and extracted in the current working directory
2. Load the feature labels
3. Subset the features using grepl to get on the desired features
4. Load the activity labels
5. Load the test data files
	1. Select the data using the ids of the desired features
	2. Activity and subject data are loaded
	3. Rename the feature data
	4. Activities and subjects are labeled as factors of the id data
6. Load the train data files
	1. Select the train data using the same criteria as the test data above
	2. Activity and subject data are loaded from the training files
	3. Rename the feature data (again, as above)
	4. Using the id data as factors, label the activities and subjects
7. Merge the test and train data together
8. Calculate mean and standard deviation on the merged data
9. Give the calculated data meaningful names
10. Write out a results file