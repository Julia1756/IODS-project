#Assignment 6 
#Name: Julia ROQUIGNY 
# Date: 09.12.2023

install.packages("readr")
library(readr)

BPRS<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep=" ", header=TRUE)
RATS<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt",header=TRUE,sep="\t")

#1 variable names, view the data contents and structures, and create some brief summaries of the variables
str(BPRS)
head(BPRS)
summary(BPRS)
View(BPRS)

str(RATS)
head(RATS)
summary(RATS)
View(RATS)

#2  Convert the categorical variables of both data sets to factors. 
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
RATS$Group <- factor(RATS$Group)
RATS$ID <- factor(RATS$ID)

#3 Convert the data sets to long form. Add a week variable to BPRS and a Time variable to RATS.
BPRSL <-  pivot_longer(BPRS, cols = -c(treatment, subject),names_to = "weeks", values_to = "bprs") %>%arrange(weeks) 

BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

RATSL <-  pivot_longer(RATS, cols = -c(Group, ID),names_to = "WD", values_to = "Weight") %>%arrange(WD) 

RATSL <-  RATSL %>% mutate(Time = as.integer(substr(WD,3,4)))

#4  new data sets 
glimpse(BPRSL)
str(BPRSL)
head(BPRSL)
summary(BPRSL)
View(BPRSL)

glimpse(RATSL)
str(RATSL)
head(RATSL)
summary(RATSL)
View(RATSL)

#SAVE DATA

write.csv(BPRSL,"D:/OneDrive/Documents/IODS-project/data/BPRSL.csv")
write.csv(RATSL,"D:/OneDrive/Documents/IODS-project/data/RATSL.csv")
