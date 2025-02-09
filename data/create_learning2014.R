#Ari Voutilainen
#November 9, 2021
#R script for data wrangling in IODS2021 Exercise 2.

lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(lrn14)
str(lrn14)

#LRN14 consists of 183 rows and 60 columns.
#The last four columns are entitled as follows: Age, Attitude, Points, and gender.

#Creating variables deep, stra, and surf.
library(dplyr)

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
surface_columns <- select(lrn14, one_of(surface_questions))

lrn14$surf <- rowMeans(surface_columns)
lrn14$atti <- lrn14$Attitude / 10

#I found the name of the one_of function misleading. It does not select just one but all.

#Creating an analysis data set.
keep_columns <- c("gender","Age","atti", "deep", "stra", "surf", "Points")
learning2014 <- select(lrn14, one_of(keep_columns))
learning2014 <- filter(learning2014, Points > 0)

#Now the analysis data set consists of 166 rows and 7 columns.

#Setting the working directory.
setwd("C:/Users/ariv/Documents/IODS-project/IODS-project/data")
getwd()

#Obs! There is an IODS-project folder inside an IODS-project folder on purpose.

#Saving the analysis data set.
?write.csv
write.csv(learning2014, file = "learning2014.csv")
read.csv("learning2014.csv")
str(learning2014)
head(learning2014)
