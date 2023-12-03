install.packages("readr")
library(readr)
human<-read.csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human1.csv")
str(human)
dim(human)
 
#The dataset contains 195 observations and 19 variables. 

#select variables 
human<-human%>%select(Country,Edu2.FM,Labo.FM,Edu.Exp,Life.Exp,GNI,Mat.Mor,Ado.Birth,Parli.F)

#remove missing values
human.na <- human[complete.cases(human), ]
str(human.na)

#Remove the observations which relate to regions instead of countries
human.na <- filter(human.na,Country != "Europe and Central Asia" & Country != "East Asia and the Pacific"  & Country != "Latin America and the Caribbean" & Country != "Sub-Saharan Africa" & Country != "Arab States"  & Country != "World" & Country !="South Asia")

str(human.na)
write.csv(human.na,"D:/OneDrive/Documents/IODS-project/data/create_human.csv")
