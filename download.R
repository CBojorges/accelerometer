#R script for downloading the accelerometer data 

#assign the file url
fileURL<-" https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#assign the destination file 
fileDest<-"./accelerometer.zip"

#download the file
download.file(fileURL,fileDest)

#unziping the file
unzip("./accelerometer.zip")

#removing the temprary variables
rm(fileURL,fileDest)
