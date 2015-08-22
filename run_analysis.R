## run_analysis.R

## This script gets training and test sets from Samsung Galaxy S experiment on
## "Human Activity Recognition by Smartphones". The script collects data, process
## them, and come up with a clean and tidy dataset for further analysis.
## This is a course project in Cousera course "Getting and Cleaning Data" by
## Dr. Jeffrey Leek from John Hopskin Bloomberg School of Public Health.
## There are "README.md" and "Codebook.md" to accompany this script.
## Please refer to these documents for explanation on how script works and its
## variables.

## There are 5 steps to complete this script.

## Step 1. Merge the training and the test sets into one dataset.
## Assumption: All files below had been downloaded in working directory below.

## Get training set with its subject and activity sets
  setwd("C:/Users/Ythie/Documents/Data Science/Getting and Cleaning Data/UCI Har Dataset/Train")
  trainset <- read.table('X_train.txt')
  trainlab <- read.table('y_train.txt')
  trainsub <- read.table('subject_train.txt')
  
## Get test set with its subject and activity sets
  setwd("C:/Users/Ythie/Documents/Data Science/Getting and Cleaning Data/UCI Har Dataset/Test")
  testset <- read.table('X_test.txt')
  testlab <- read.table('y_test.txt')
  testsub <- read.table('subject_test.txt')
  
## Get measurement features and activity label
  setwd("C:/Users/Ythie/Documents/Data Science/Getting and Cleaning Data/UCI Har Dataset")
  actlab <- read.table('activity_labels.txt')
  featur <- read.table('features.txt')

## Merge training and test sets along with their corresponding subject and activity
## Merged data consist of person ID, activity, measurement
  training <- cbind(trainsub, trainlab, trainset)
  test <- cbind(testsub, testlab, testset)
  train_test <- rbind(training, test)
  
## Step 3 and 4. Use descriptive activity names and descriptive and
## descriptive measurement variable names.
  colnames(train_test) <- c('person', 'activity', as.character(featur$V2))
  train_test$activity <- as.character(actlab$V2)[train_test$activity]

## Step 2. Extract mean and standard deviation measurements from each variable.
## Only columns with mean() and std() labels are extracted, resulting in
## 2 x 33 measurement sets from training and test sets, respectively
  avg <- train_test[grepl('mean()', names(train_test), fixed = T)]
  std <- train_test[grepl('std()', names(train_test), fixed = T)]
  avg_std <- cbind(train_test$person, train_test$activity, avg, std)
  colnames(avg_std)[1:2] <- c('person','activity')

## Step 5. Create a second independent and tidy data set of average of all mean
## and standard deviation measurement from step 4.
## Final tidy dataset have its own variable names
  library(reshape2) ## Assumption: package 'reshape2' had been installed
  avg_std_melt <- melt(avg_std, id=c('person','activity'), measure.vars=c(names(avg), names(std)), na.rm = T)
  mean_tidy <- dcast(avg_std_melt, person + activity ~ variable, mean)
  colnames(mean_tidy) <- gsub('()', '-avg', names(mean_tidy), fixed = T) ## Appropriate Labelling
  colnames(mean_tidy) <- gsub('BodyBody', 'Body', names(mean_tidy), fixed = T)
  
## Write the tidy mean dataset into a file  
  setwd("C:/Users/Ythie/Documents/Data Science/Getting and Cleaning Data")
  write.table(mean_tidy,'samsung_galaxy_s_meandata.txt',row.names=F)
