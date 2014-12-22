run_analysis <- function(getdata=TRUE){
  ##Assumes that the data.table and downloader packages are installed
  
  ##if getdata=TRUE then get and and unzip the file
  ##if getdata=FALSE then we assume they already extracted the file
  if(getdata==TRUE){
  url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  file <- 'dataset.zip'
  download(url,file)
  unzip(file)}
  
  ##now that we're sure there is a folder, change the working directory
  setwd('UCI HAR Dataset/')
  
  ##load feature labels and activity labels
  featureLabelData <- read.table('features.txt', col.names=c('id','label'))
  selectFeatures <- subset(featureLabelData, grepl('-(mean|std)\\(',featureLabelData$label))
  activityLabels <- read.table('activity_labels.txt', col.names=c('id','label'))
  
  ##get the test data
  featureFile <- 'test/X_test.txt'
  activityFile <- 'test/y_test.txt'
  subjectsFile <- 'test/subject_test.txt'
  featureData <- read.table(featureFile)[,selectFeatures$id]
  activityData <- read.table(activityFile)[,1]
  subjectData <- read.table(subjectsFile)[,1]
  names(featureData) <- selectFeatures$label
  featureData$label <- factor(activityData, levels=activityLabels$id, labels=activityLabels$label)
  featureData$subject <- factor(subjectData)
  testdata <- featureData
  
  ##get the training data
  featureFile <- 'train/X_train.txt'
  activityFile <- 'train/y_train.txt'
  subjectsFile <- 'train/subject_train.txt'
  featureData <- read.table(featureFile)[,selectFeatures$id]
  activityData <- read.table(activityFile)[,1]
  subjectData <- read.table(subjectsFile)[,1]
  names(featureData) <- selectFeatures$label
  featureData$label <- factor(activityData, levels=activityLabels$id, labels=activityLabels$label)
  featureData$subject <- factor(subjectData)
  traindata <- featureData
  
  ##merge the data
  mergedata <- rbind(traindata, testdata)
  mergedataTable <- data.table(mergedata)
  
  ##analyze the data
  results <- mergedataTable[, lapply(.SD, mean), by=list(label,subject)]
  
  ##finish tidying the data by naming everything
  resultsNames <- names(results)
  resultsNames <- gsub('-mean', 'Mean', resultsNames)
  resultsNames <- gsub('-std', 'Std', resultsNames)
  resultsNames <- gsub('[()-]', '', resultsNames)
  resultsNames <- gsub('BodyBody', 'Body', resultsNames)
  setnames(results, resultsNames)
  
  ##write out the output of analysis
  setwd('..')
  write.csv(mergedataTable, file='uci-har-RAW.csv', row.names=FALSE)
  write.table(results, file='uci-har-TIDY.txt', sep='\t', row.names=FALSE, quote=FALSE)
  
  print("Finished. New files have been created.")
  
}