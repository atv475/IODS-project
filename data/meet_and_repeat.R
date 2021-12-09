#Ari Voutilainen
#December 7, 2021
#R script for data wrangling in IODS2021 Exercise 6.

#FIRST, I operate with the BPRS data set.

#Loading the BPRS data set into R, exploring it briefly, and concerting treatment and subject variables to factors.
#In the BPRS study, 40 male subjects were randomly assigned to one of two treatment groups and each subject was rated on the brief psychiatric rating scale (BPRS) measured before treatment began (week 0) and then at weekly intervals for eight weeks.
setwd("C:/Users/ariv/Documents/IODS-project/IODS-project/data")
getwd()
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
names(BPRS)
str(BPRS)
summary(BPRS)
write.csv(BPRS, file = "BPRS.csv")
read.csv("BPRS.csv")
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
#BPRS data set consists of 40 observations (rows) of 11 variables (columns).

#Converting the BPRS data set to long form, adding a week variable to it, and exploring the data set briefly.
library(dplyr)
library(tidyr)
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))
glimpse(BPRSL)
names(BPRSL)
str(BPRSL)
summary(BPRSL)
write.csv(BPRSL, file = "BPRSL.csv")
read.csv("BPRSL.csv")
#BPRSL data set consists of 360 observations (rows) of 5 variables (columns).

#SECOND, I operate with the RATS data set.

#Loading the RATS data set into R, exploring it briefly, and converting ID and Group variables to factors.
#In the RATS study, three groups of rats were put on different diets, and each animal’s body weight in grams was recorded repeatedly over a 9-week period.
setwd("C:/Users/ariv/Documents/IODS-project/IODS-project/data")
getwd()
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep  ="\t", header = T)
names(RATS)
str(RATS)
summary(RATS)
write.csv(RATS, file = "RATS.csv")
read.csv("RATS.csv")
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
#RATS data set consists of 16 observations (rows) of 13 variables (columns).

#Converting the RATS data set to long form, adding Time variable to it, and exploring the data set briefly.
library(dplyr)
library(tidyr)
RATSL <- RATS %>% gather(key = WD, value = Weight, -ID, -Group) %>% mutate(Time = as.integer(substr(WD,3,4)))
glimpse(RATSL)
names(RATSL)
str(RATSL)
summary(RATSL)
write.csv(RATSL, file = "RATSL.csv")
read.csv("RATSL.csv")
#RATSL data set consists of 176 observations (rows) of 5 variables (columns).