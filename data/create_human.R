#Ari Voutilainen
#November 22, 2021
#R script for data wrangling in IODS2021 Exercise 4.

#Reading "Human development" (HD) and "Gender inequality" (GI) data sets into R.
setwd("C:/Users/ariv/Documents/IODS-project/IODS-project/data")
getwd()
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Exploring the HD data set.
colnames(hd)
str(hd)
dim(hd)
summary(hd)
#The HD data set consists of 195 rows (countries) and 8 variables to be used to build the Human Development Index (HDI).

#Exploring the GI data set.
colnames(gii)
str(gii)
dim(gii)
summary(gii)
#The GI data set consists of 195 rows (countries) and 10 variables to be used to build the Gender Inequality Index (GII).

#Renaming the HD variables.
library(tidyverse)
colnames(hd)
rename(hd, HDIrank = HDI.Rank
       , HDI = Human.Development.Index..HDI.
       , LE = Life.Expectancy.at.Birth
       , EDUCexp = Expected.Years.of.Education
       , EDUCmean = Mean.Years.of.Education
       , GNI = Gross.National.Income..GNI..per.Capita
       , GNIHDI = GNI.per.Capita.Rank.Minus.HDI.Rank
       )

#Renaming the GI variables.
colnames(gii)
rename(gii, GIIrank = GIIrank
       , GII = Gender.Inequality.Index..GII.
       , MMR = Maternal.Mortality.Ratio
       , ABR = Adolescent.Birth.Rate
       , Parl = Percent.Representation.in.Parliament
       , EDUCF = Population.with.Secondary.Education..Female.
       , EDUCM = Population.with.Secondary.Education..Male.
       , LABF = Labour.Force.Participation.Rate..Female.
       , LABM = Labour.Force.Participation.Rate..Male.
       )