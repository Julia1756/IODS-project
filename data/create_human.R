Julia ROQUIGNY
Date: 28.11.2023
Assignment 4


# 2

# Read in the “Human development” and “Gender inequality” data sets 

library(readr)
library(dplyr)

humandev <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human_development.csv")
gender <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/gender_inequality.csv", na = "..")




#3

# Explore the datasets: see the structure and dimensions of the data. Create summaries of the variables. (1 point)

str(humandev)
str(gender)
dim(humandev)
dim(gender)
summary(humandev)
summary(gender)



#4


# see colnames in gender 
colnames(gender)


# rename gender variables
gender <- rename(gender, "gender_rank" = 1, "country" = 2,  "gender_ineq_rate" = 3, "mort_ratio" = 4, "birth_rate" = 5, "parliam_perc" = 6,  "edu_f" = 7,  "edu_m" = 8,    "labo_f" = 9,    "labo_m" = 10)

# see new colnames in gender 
colnames(gender)

# see new colnames in human 
colnames(humandev)


# rename human variables 
humandev <- rename(humandev, 
             "hdi_rank" = 1, 
             "country" = 2,
             "hdi_index" = 3, 
             "exp_life" = 4, 
             "exp_educ" = 5, 
             "mean_educ" = 6, 
             "gni" = 7, 
             "gni_minus_hdi_rank" = 8) 


# see new colnames in humandev
colnames(humandev)


#5


# create new variables 
gender_mut <- mutate(gender, edu_ratio = edu_f / edu_m, labo_ratio = labo_f / labo_m)


#6

# join the datasets together 
human <- inner_join(humandev, gender_mut, by = "country")

# check the dimensions 
dim(human) # 195 rows and 19 cols as supposed to 

# save the data 

write.csv(human,"D:/OneDrive/Documents/IODS-project/data/create_human.csv")
