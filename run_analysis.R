##Reading the data
features<-read.table("./UCI HAR Dataset/features.txt")
#Transposing the matrix and eliminating the first column
features<-t(features[2])
#Converting all the text to lower case
features<-tolower(features)
#Converting "-" to ""
features <- gsub("-", "", features)
#Converting "," to ""
features <- gsub(",", "", features)
#Converting "(" to ""
features <- gsub("\\(", "", features)
#Converting ")" to ""
features <- gsub("\\)", "", features)
#Reading the sensors data
xTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
xTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
yTest<-read.table("./UCI HAR Dataset/test/y_test.txt")


##Adding labels to the variables
#Reading the labels file
labels<-read.table("./UCI HAR Dataset/activity_labels.txt",colClasses = "character")
#Converting the characters to lower case and removing V1
labels<-tolower(labels$V2)
#Converting the data to data frames
yTrain <- as.data.frame(factor(yTrain$V1, levels=c(1,2,3,4,5,6), labels=labels) )
yTest <- as.data.frame(factor(yTest$V1, levels=c(1,2,3,4,5,6), labels=labels) )
#Adding the names to the data frames
names(yTrain)<-"activity"
names(yTest)<-"activity"
names(xTrain)<-features
names(xTest)<-features
#Removing unnecesary data
rm(labels,features)
#Adding a new variable called type 
type <- "train"
names(type) <- "type"
type2 <- 'test'
names(type2) <- 'type'


##Merging the vectors as a data frame for "train" and "test"
train <- as.data.frame( c(type, yTrain, xTrain) )
test <- as.data.frame( c(type2, yTest, xTest) )
#Removing unnecesary data
rm(yTrain,xTrain,yTest,xTest)

##Binding by rows the test and train data frames
aData <- rbind(train, test)
#Removing unnecesary data
rm(train,test)


##Subsetting the accelerometer data, selecting only the vectors in which name includes "mean" or "std"
tidyData<- subset(aData, select = grep("mean|std",names(aData)))

#Saving the tidy accelerometer data
save(tidyData,file="accelerometerData.RData")
#Expórting the data as a csv file
write.csv(tidyData, file = 'accelerometerData.csv', row.names=F)

#Removing unnecesary data
rm(aData)

##Creating the data frame with the means 
#Calculating the means
means<-as.vector(sapply(tidyData, mean ))

#Creating the tidy data frame
means<-as.data.frame(cbind(names(tidyData),means))
names(means)<-c("variable","mean")

#Saving the means 
save(means,file = "means.RData")
#Exporting the data frame as a csv file
write.csv(means,file = "means.csv",row.names = F)
