---
title: "Code Book"
author: "ythie"
date: "August 21, 2015"
output: html_document
---


### Human Activity Recognition Using Samsung Galaxy S Smartphone

**Introduction**

* Filename: run_analysis.R

* This script gets training and test sets from Samsung Galaxy S   experiment on "Human Activity Recognition by Smartphones".     The script collects data, process them, and come up with a     clean and tidy dataset for further analysis.

* This is a course project in Cousera course "Getting and 
  Cleaning Data" by Dr. Jeffrey Leek from John Hopskin           Bloomberg School of Public Health.

* There are 5 steps to complete this script:

    + Step 1. Merge the training and the test sets into one          dataset along with their corresponding subjects and            activities performed.
      Assumption: All files needed had been downloaded and           extracted into each respective working directory.
    
    + Step 2. Extract only the means and standard deviation for
      for each measurement. In this case, only variables with        'mean()' and 'std()' names are extracted. Varable              'meanfreq()' is not included.
      
    + Step 3. Each subject activity is given a descriptive           name.
    
    + Step 4. Each measurement variable is given a descriptive       name.
    
    + Step 5. A separate independent tidy dataset is created         from step 4 dataset. This tidy dataset contain the             average of each mean and standard deviation per each           activity per subject (person). The table is arranged           starting from person 1 with 6 activities and 66                measurements (180 rows by 68 columns).
    
* The resultant tidy dataset is output to a file called          'samsung_galaxy_s_meandata.txt' in workind directory. To       retrieve the data, please use read.table() command with        row.names = FALSE option. Then, use view() to view the data.
  
**Variables**

1. trainset = training dataset  
   trainlab = training activity names  
   trainsub = training subject (person)
   
2. testset = test dataset  
   testlab = test activity names  
   testsub = test subject (person)
   
3. actlab = activity label (walking, walking upstairs, walking              downstairs, sitting, standing, laying)  
   featur = measurement variables (561 items)
   
4. avg = mean() (mean measurement) dataset extracted  
   std = std() (standard deviation measurement) dataset                  extracted  
   avg_std = combined dataset of subject, activity, means() and               std()

5. avg_std_melt = reshaped avg_std dataset arranged per subject                   and activity. All measurements are made into                    one column  
   mean_tidy = final tidy dataset with average of all means and
               standard deviation

6. Measurements:
    + tBodyAcc-mean-avg-XYZ = subject 3 dimensional body              acceleration mean average  
    + tBodyAcc-std-avg-XYZ = subject 3 dimensional body               acceleration standard deviation average  
    + tGravityAcc-mean-avg-XYZ = subject 3 dimensional gravity        linear acceleration mean average  
    + tGravityAcc-std-avg-XYZ = subject 3 dimensional gravity         linear acceleration standard deviation average  
    + tBodyAccJerk-mean-avg-XYZ = subject 3 dimensional body
      linear acceleration jerk mean average  
    + tBodyAccJerk-std-avg-XYZ = subject 3 dimensional body
      linear acceleration jerk standard deviation average  
    + tBodyGyro-mean-avg-XYZ = subject 3 dimensional body
      angular acceleration mean average  
    + tBodyGyro-std-avg-XYZ = subject 3 dimensional body             angular acceleration standard acceleration average  
    + tBodyGyroJerk-mean-avg-XYZ = subject 3 dimensional body         angular acceleration jerk mean average  
    + tBodyGyroJerk-std-avg-XYZ = subject 3 dimensional body
      angular acceleration jerk standard deviation average  
    + tBodyAccMag-mean-avg = subject body linear acceleration         magnitude mean average  
    + tBodyAccMag-std-avg = subject body linear acceleration          magnitude standard deviation average  
    + tBodyGyroMag-mean-avg = subject body angular acceleration
      magnitude mean average  
    + tBodyGyroMag-std-avg = subject body angular acceleration
      magnitude standard deviation average  
    + fBodyAcc-mean-avg-XYZ = subject body 3 dimensional FFT        (Fast Fourier Transform) linear acceleration mean average 
    + fBodyAcc-std-avg-XYZ = subject body 3 dimensional FFT
      linear acceleration standard deviation average  
    + fBodyAccJerk-mean-avg = subject body 3 dimensional FFT
      linear acceleration jerk mean average  
    + fBodyAccJerk-std-avg = subject body 3 dimensional FFT
      linear acceleration jerk standard deviation average  
    + fBodyGyro-mean-avg = subject body 3 dimensional FFT
      angular acceleration mean average  
    + fBodyGyro-std-avg = subject body 3 dimensional FFT
      angular acceleration standard deviation average  
    + fBodyAccMag-mean-avg = subject body FFT linear
      acceleration magnitude mean average  
    + fBodyAccMag-std-avg = subject body FFT linear
      acceleration magnitude standard deviation average  
    + fBodyGyroMag-mean-avg = subject body FFT angular
      acceleration magnitude mean average  
    + fBodyGyroMag-std-avg = subject body FFT angular
      acceleration magnitude standard deviation average  
    + fBodyGyroJerkMag-mean-avg = subject body FFT angular
      acceleration jerk magnitude mean average  
    + fBodyGyroJerkMag-std-avg = subject body FFT angular
      acceleration jerk magnitude standard deviation average  