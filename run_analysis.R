library(data.table)
library(reshape2)

#Read activity labels
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

#Read column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#Extract mean and std dev for each measurment
extract.features <- grepl("mean|std", features)

#read X_Test and Y_Test
X.Test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y.Test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X.Test) = features

#Pull only the measurements on the mean and std dev for each measurement
X.Test <- X.Test[,extract.features]

#Pull in activity labels
Y.Test[,2] <- activity.labels[Y.Test[,1]]
names(Y.Test) <- c("Activity_ID", "Activity_Label")
names(subject.test) <- "subject"

#Bind data together
test.data <- cbind(as.data.table(subject.test), Y.Test, X.Test)

#Load X_Train and Y_Train
X.Train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y.Train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("./UCI HAR Dataset/train/y_train.txt")

names(X.Train) <- features

#Pull only the measurements on the mean and std dev for each measurement
X.Train <- X.Train[,extract.features]

#Pull activity data
Y.Train[,2] <- activity.labels[Y.Train[,1]]
names(Y.Train) <- c("Activity_ID", "Activity_Label")
names(subject.train) = "subject"

#Bind data together
train.data <- cbind(as.data.table(subject.train), Y.Train, X.Train)

#Merge Train and Test
data <- rbind(test.data, train.data)

id.labels <- c("subject", "Activity_ID", "Activity_Label")
data.labels <- setdiff(colnames(data), id.labels)
melt.data <- melt(data, id = id.labels, measure.vars = data.labels)

#Apply mean to dataset
tidy.data = dcast(melt.data, subject + Activity_Label ~ variable, mean)

#Export data to file
write.table(tidy.data, file= "tidy_data.txt", row.names = FALSE)
