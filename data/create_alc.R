#Data wrangling - Assignment 3 
## Julia ROQUIGNY 
### Date: 20.11.2023  

install.packages("dplyr")
library(dplyr)

# Read and explore the structure of datasets 
data <- read.csv("student-mat.csv", sep=";", header=TRUE)
data2<- read.csv("student-por.csv", sep=";", header=TRUE)

str(data)
dim(data)

str(data2)
dim(data2)

#columns identifiers 
col_stud_identifiers<-c("failures","paid","absences","G1","G2","G3")
col_stud_identifiers
col_join<-setdiff(colnames(data),col_stud_identifiers)
col_join

#join datasets
data_2 <- inner_join(data, data2, by = col_join)
data_2
str(data_2)

alc<-select(data_2, all_of(col_join))
alc

# for every column name not used for joining...

for(col_name in col_stud_identifiers) {
  # select two columns from 'data_2' with the same original name
  two_cols <- select(data_2, starts_with(col_name))
  # select the first column vector of those two columns
  first_col <- select(two_cols, 1)[[1]]
  
  # then, enter the if-else structure!
  # if that first column vector is numeric...
  if(is.numeric(first_col)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[col_name] <- round(rowMeans(two_cols))
  } else { # else (if the first column vector was not numeric)...
    # add the first column vector to the alc data frame
    alc[col_name] <- first_col
  }
}

#6 
alc <- mutate(join_column_only, alc_use = (Dalc + Walc) / 2)
alc <- mutate(join_column_only, high_use = alc_use > 2)

#7 glimpse of joined and modified data 

glimpse(alc)

str(alc)

install.packages("readr")
library(readr)
write_csv(alc,file="D:/OneDrive/Documents/IODS-project/data/alc.csv")
