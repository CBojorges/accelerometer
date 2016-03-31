#R script for downloading the accelerometer data 

#set work directory
setwd("/media/mynewdrive/Documentos/Coursera/Cleaning Data/Data Course Project")

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
