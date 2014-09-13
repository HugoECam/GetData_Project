# Introduction

This repository contains the R code for the Project assignment of the DataScience track's "Getting and Cleaning Data" course.

The purpose of this project is to demonstrate the collection, work with, and cleaning of this data set. 

A Tidy data will be created as result of this project assigment. The file tidy.txt will created on the current directory.

# Data Set

The data set "Human Activity Recognition Using Smartphones" has been taken from UCI.

The training and test data are available in folders named train and test respectively.

For each of these data sets:
Measurements are present in X_\<dataset\>.txt file
Subject information is present in subject_\<dataset\>.txt file
Activity codes are present in y_\<dataset\>.txt file

All activity codes and their labels are in a file named activity_labels.txt.

Names of all measurements taken are present in file features.txt ordered and indexed as they appear in the X_\<dataset\>.txt files.

All columns representing means contain ...mean() in them.
All columns representing standard deviations contain ...std() in them.


# Execution and files

The Data Set has been stored in UCI HAR Dataset/ directory.

The CodeBook.md describes the variables, the data, and the work that has been performed to clean up the data.

The run_analysis.R is the script that has been used for this work. It can be loaded in R/Rstudio and executed without any parameters.

The result of the execution is that a tidy.txt file is being created, that stores the data (mean and standard deviation of each measurement per activit and subject).


# Running the script

- Clone this repository
- Download the data set and extract. It should result in a UCI HAR Dataset folder that has all the files in the required structure.
- Change current directory to the UCI HAR Dataset folder.
- Run Rscript <path to>/run_analysis.R
- The tidy dataset should get created in the current directory as tidy.txt
