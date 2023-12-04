install.packages("readr")
library(readr)
human<-read.csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human1.csv")
str(human)
dim(human)
 
#The dataset contains 195 observations and 19 variables. 

#select variables 
keep<-c("Country","Edu2.FM","Labo.FM","Edu.Exp","Life.Exp","GNI","Mat.Mor","Ado.Birth","Parli.F")
human <- select(human, one_of(keep))

#remove missing values
human.na <- filter(human,complete.cases(human))
str(human.na)

# define the last indice we want to keep
last <- nrow(human.na) - 7

#Remove the observations which relate to regions instead of countries by choosing everything until the last 7 observations
human_ <- human.na[1:last, ]
str(human_)

write.csv(human_,"D:/OneDrive/Documents/IODS-project/data/create_human.csv")
