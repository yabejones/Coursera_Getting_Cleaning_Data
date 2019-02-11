## Load Packages
pacman::p_load(tidyverse,lubridate,data.table,stringr)

## Load, clean up the column names
cnames <- fread('features.txt')
cnames_mean <- cnames %>%
      filter((V2 %like% 'mean()') & (!V2 %like% 'Freq'))
cnames_std <- cnames %>%
      filter(V2 %like% 'std()')
cnames_relevant <- rbind(cnames_mean,cnames_std) %>%
      arrange(V1) ## Sort ascending
cnames_relevant$V2 = gsub("-","_",cnames_relevant$V2)
cnames_relevant$V2 = gsub("\\(","",cnames_relevant$V2)
cnames_relevant$V2 = gsub("\\)","",cnames_relevant$V2)
cnames_relevant$V2 = sub("^[t]","time_",cnames_relevant$V2)
cnames_relevant$V2 = sub("^[f]","fft_",cnames_relevant$V2)
cols <- cnames_relevant$V1

##### Import and label test data #####
testX <- fread('./test/X_test.txt')
testX <- testX[,..cols]## Keeps only columns selected above
names(testX) <- cnames_relevant$V2

testY <- fread('./test/Y_test.txt')
testY <- testY %>% ## Add descriptive labels to activities
      mutate(Activity = case_when(V1 == 1 ~ 'Walking',
                                  V1 == 2 ~ 'Walking Upstairs',
                                  V1 == 3 ~ 'Walking Downstairs',
                                  V1 == 4 ~ 'Sitting',
                                  V1 == 5 ~ 'Standing',
                                  V1 == 6 ~ 'Laying')) %>%
      select(-V1)

tst_subj <- fread('./test/subject_test.txt')
names(tst_subj) <- 'Subject'

test <- cbind(tst_subj,testY,testX) ## smush columns together

##### Import and label Training data (do exactly same as for test) ##### 
trainX <- fread('./train/X_train.txt')
trainX <- trainX[,..cols]
names(trainX) <- cnames_relevant$V2

trainY <- fread('./train/Y_train.txt')
trainY <- trainY %>%
      mutate(Activity = case_when(V1 == 1 ~ 'Walking',
                                  V1 == 2 ~ 'Walking Upstairs',
                                  V1 == 3 ~ 'Walking Downstairs',
                                  V1 == 4 ~ 'Sitting',
                                  V1 == 5 ~ 'Standing',
                                  V1 == 6 ~ 'Laying')) %>%
      select(-V1)

tr_subj <- fread('./train/subject_train.txt')
names(tr_subj) <- 'Subject'

train <- cbind(tr_subj,trainY,trainX) 

##### Combine Train and Test #####
combined <- rbind(train,test) %>%
      group_by(Subject,Activity) 

averageReadings_by_Subject_Activity <- combined %>%
      summarise(meanBodyAccX_time = mean(time_BodyAcc_mean_X),
                meanBodyAccY_time = mean(time_BodyAcc_mean_Y),
                meanBodyAccZ_time = mean(time_BodyAcc_mean_Z),
                stdBodyAccX_time = mean(time_BodyAcc_std_X),
                stdBodyAccY_time = mean(time_BodyAcc_std_Y),
                stdBodyAccZ_time = mean(time_BodyAcc_std_Z),
                meanGravityAccX_time = mean(time_GravityAcc_mean_X),
                meanGravityAccY_time = mean(time_GravityAcc_mean_Y),
                meanGravityAccZ_time = mean(time_GravityAcc_mean_Z),
                stdGravityAccX_time = mean(time_GravityAcc_std_X),
                stdGravityAccY_time = mean(time_GravityAcc_std_Y),
                stdGravityAccZ_time = mean(time_GravityAcc_std_Z),
                meanBodyAccJerkX_time = mean(time_BodyAccJerk_mean_X),
                meanBodyAccJerkY_time = mean(time_BodyAccJerk_mean_Y),
                meanBodyAccJerkZ_time = mean(time_BodyAccJerk_mean_Z),
                stdBodyAccJerkX_time = mean(time_BodyAccJerk_std_X),
                stdBodyAccJerkY_time = mean(time_BodyAccJerk_std_Y),
                stdBodyAccJerkZ_time = mean(time_BodyAccJerk_std_Z),
                meanBodyGyroX_time = mean(time_BodyGyro_mean_X),
                meanBodyGyroY_time = mean(time_BodyGyro_mean_Y),
                meanBodyGyroZ_time = mean(time_BodyGyro_mean_Z),
                sdtBodyGyroX_time = mean(time_BodyGyro_std_X),
                stdBodyGyroY_time = mean(time_BodyGyro_std_Y),
                stdBodyGyroZ_time = mean(time_BodyGyro_std_Z),
                meanBodyGyroJerkX_time = mean(time_BodyGyro_mean_X),
                meanBodyGyroJerkY_time = mean(time_BodyGyro_mean_Y),
                meanBodyGyroJerkZ_time = mean(time_BodyGyro_mean_Z),
                stdBodyGyroJerkX_time = mean(time_BodyGyro_std_X),
                stdBodyGyroJerkY_time = mean(time_BodyGyro_std_Y),
                stdBodyGyroJerkZ_time = mean(time_BodyGyro_std_Z),
                meanBodyAccMag_time = mean(time_BodyAccMag_mean),
                stdBodyAccMag_time = mean(time_BodyAccMag_std),
                meanGravityAccMag_time = mean(time_GravityAccMag_mean),
                stdGravityAccMag_time = mean(time_GravityAccMag_std),
                meanBodyAccJerkMag_time = mean(time_BodyAccJerkMag_mean),
                stdBodyAccJerkMag_time = mean(time_BodyAccJerkMag_std),
                meanBodyGyroMag_time = mean(time_BodyGyroMag_mean),
                stdBodyGyroMag_time = mean(time_BodyGyroMag_std),
                meanBodyGyroJerkMag_time = mean(time_BodyGyroJerkMag_mean),
                stdBodyGyroJerkMag_time = mean(time_BodyGyroJerkMag_std),
                meanBodyAccX_fft = mean(fft_BodyAcc_mean_X),
                meanBodyAccY_fft = mean(fft_BodyAcc_mean_Y),
                meanBodyAccZ_fft = mean(fft_BodyAcc_mean_Z),
                stdBodyAccX_fft = mean(fft_BodyAcc_std_X),
                stdBodyAccY_fft = mean(fft_BodyAcc_std_Y),
                stdBodyAccZ_fft = mean(fft_BodyAcc_std_Z),
                meanBodyAccJerkX_fft = mean(fft_BodyAccJerk_mean_X),
                meanBodyAccJerkY_fft = mean(fft_BodyAccJerk_mean_Y),
                meanBodyAccJerkZ_fft = mean(fft_BodyAccJerk_mean_Z),
                stdBodyAccJerkX_fft = mean(fft_BodyAccJerk_std_X),
                stdBodyAccJerkY_fft = mean(fft_BodyAccJerk_std_Y),
                stdBodyAccJerkZ_fft = mean(fft_BodyAccJerk_std_Z),
                meanBodyGyroX_fft = mean(fft_BodyGyro_mean_X),
                meanBodyGyroY_fft = mean(fft_BodyGyro_mean_Y),
                meanBodyGyroZ_fft = mean(fft_BodyGyro_mean_Z),
                stdBodyGyroX_fft = mean(fft_BodyGyro_std_X),
                stdBodyGyroY_fft = mean(fft_BodyGyro_std_Y),
                stdBodyGyroZ_fft = mean(fft_BodyGyro_std_Z),
                meanBodyAccMag_fft = mean(fft_BodyAccMag_mean),
                stdBodyAccMag_fft = mean(fft_BodyAccMag_std),
                meanBodyBodyAccJerkMag_fft = mean(fft_BodyBodyAccJerkMag_mean),
                stdBodyBodyAccJerkMag_fft = mean(fft_BodyBodyAccJerkMag_std),
                meanBodyBodyGyroMag_fft = mean(fft_BodyBodyGyroMag_mean),
                stdBodyBodyGyroMag_fft = mean(fft_BodyBodyGyroMag_std),
                meanBodyBodyGyroJerkMag_fft = mean(fft_BodyBodyGyroJerkMag_mean),
                stdBodyBodyGyroJerkMag_fft = mean(fft_BodyBodyGyroJerkMag_std))

write.table(averageReadings_by_Subject_Activity,'AvgReadings_by_Subj_Activity.txt',row.names = FALSE)

### Alternative way to create final tidy dataset, but probably not consistent with class goals ###
#cols <- names(combined)[-c(1,2)]

# the dots component of your call to summarise
#dots <- sapply(cols,function(x) substitute(mean(x), list(x=as.name(x))))
#result <- do.call(summarise, c(list(.data=combined), dots))




