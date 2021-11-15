#Ari Voutilainen
#November 15, 2021
#R script for data wrangling in IODS2021 Exercise 3.
#Reference of the data source: Paulo Cortez, University of Minho, GuimarÃ£es, Portugal, http://www3.dsi.uminho.pt/pcortez
#Citation of the database: P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7.

#Reading student-mat.csv and student-por.csv into R.
setwd("C:/Users/ariv/Documents/IODS-project/IODS-project/data")
getwd()
mat <- read.table("student-mat.csv", sep = ";", header=TRUE)
colnames(mat)
por <- read.table("student-por.csv", sep = ";", header=TRUE)
colnames(por)

#Joining the mat and por data sets.
library(dplyr)
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","guardian","traveltime","studytime","schoolsup","famsup","activities","nursery","higher","internet","romantic","famrel","freetime","goout","Dalc","Walc","health")
mat_por <- inner_join(mat, por, by = join_by)
colnames(mat_por)
str(mat_por)
glimpse(mat_por)

#There are now 370 rows (students) and 39 columns (variables) in the mat_por data set.

#Combining 'duplicated' answers and creating the alc data set.
alc <- select(mat_por, one_of(join_by))
colnames(mat_por)
two_failures <- select(mat_por, 'failures.x', 'failures.y')
alc$failures <- round(rowMeans(two_failures))
two_paid <- select(mat_por, 'paid.x', 'paid.y')
first_paid <- select(two_paid, 1)[[1]]
alc$paid <- first_paid
two_absences <- select(mat_por, 'absences.x', 'absences.y')
alc$absences <- round(rowMeans(two_absences))
two_G1 <- select(mat_por, 'G1.x', 'G1.y')
alc$G1 <- round(rowMeans(two_G1))
two_G2 <- select(mat_por, 'G2.x', 'G2.y')
alc$G2 <- round(rowMeans(two_G2))
two_G3 <- select(mat_por, 'G3.x', 'G3.y')
alc$G3 <- round(rowMeans(two_G3))
colnames(alc)
str(alc)
glimpse(alc)

#Creating the alc_use and high_use variables.
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)
alc <- mutate(alc, high_use = alc_use > 2)
alc$alc_use
alc$high_use

#Saving the alc data set to the 'data' folder.
glimpse(alc)

#There are now 370 rows (students) and 35 columns (variables) in the alc data set.
write.csv(alc, file = "alc.csv")
read.csv("alc.csv")
str(alc)
head(alc)
colnames(alc)
