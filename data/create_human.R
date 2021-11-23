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

#Renaming the HD variables
library(dplyr)
hd <- transmute(hd, HDI.Rank = HDI.Rank
                , Country = Country
                , HDI = Human.Development.Index..HDI.
                , Life.Exp = Life.Expectancy.at.Birth
                , Edu.Exp = Expected.Years.of.Education
                , Edu.Mean = Mean.Years.of.Education
                , GNI = Gross.National.Income..GNI..per.Capita
                , GNI.Minus.Rank = GNI.per.Capita.Rank.Minus.HDI.Rank
                )
names(hd)

#Renaming the GI variables.
gii <- transmute(gii, GII.Rank = GII.Rank
                 , Country = Country
                 , GII = Gender.Inequality.Index..GII.
                 , Mat.Mor = Maternal.Mortality.Ratio
                 , Ado.Birth = Adolescent.Birth.Rate
                 , Parli.F = Percent.Representation.in.Parliament
                 , Edu2.F = Population.with.Secondary.Education..Female.
                 , Edu2.M = Population.with.Secondary.Education..Male.
                 , Labo.F = Labour.Force.Participation.Rate..Female.
                 , Labo.M = Labour.Force.Participation.Rate..Male.
                 )
names(gii)

#Creating new variables to the GI data set.
gii <- mutate(gii, Edu2.FM = Edu2.F / Edu2.M
              , Labo.FM = Labo.F / Labo.M
              )
names(gii)

#Joining the HD and GI data sets.
human <- inner_join(hd, gii, by = "Country")
colnames(human)
str(human)
glimpse(human)

#There are now 195 rows (countries) and 19 columns in the human data set.

#Saving the human data set to the 'data' folder.
write.csv(human, file = "human.csv")
read.csv("human.csv")
head(human)
