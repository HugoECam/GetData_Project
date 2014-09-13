# Getting and Cleaning Data Project

# steps
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# 1. Merges the training and the test sets to create one data set.
library(data.table)

## download

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")

## read data

test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_act <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_act <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

colnames(test_act)<-c("Activity")
colnames(train_act)<-c("Activity")
colnames(test_sub)<-c("Subject")
colnames(train_sub)<-c("Subject")


# 3. Uses descriptive activity names to name the activities in the data set
#   using a factor function to assign the names to the activities
#   it is assignning the activity label to the data set based on the activity code
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
test_act$V1 <- factor(test_act$Activity,levels=activities$V1,labels=activities$V2)
train_act$V1 <- factor(train_act$Activity,levels=activities$V1,labels=activities$V2)

# 4. Appropriately labels the data set with descriptive activity names
#     features.txt contains 561 names of the feaures.
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
colnames(test)<-features$V2
colnames(train)<-features$V2

# 1. merge test and training sets into one data set, including the activities
#    adding columns activity and subject
test <-cbind(test,test_act)
test <-cbind(test,test_sub)
train <-cbind(train,train_act)
train <-cbind(train,train_sub)
#    add two data tables
allData<-rbind(test,train)

# 2. extract only the measurements on the mean and standard deviation for each measurement
allData_mean<-sapply(allData,mean,na.rm=TRUE)
allData_sd<-sapply(allData,sd,na.rm=TRUE)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
DT <- data.table(allData)
tidy<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy.txt",sep=",",row.names = FALSE)