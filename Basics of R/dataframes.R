install.packages("tidyverse")
library(ggplot2)
data("diamonds")
View(diamonds)
head(diamonds)
str(diamonds)
colnames(diamonds)

# create a new column
library(tidyverse)
mutate(diamonds, carat_2=carat*100)

# create dataframe from scratch using vectors
names <- c("A", "B", "C", "D")
age <- c(20, 30, 40, 50)
people <- data.frame(names, age)

head(people)
str(people)
glimpse(people)
colnames(people)
mutate(people, age_in_20=age+20)

# create dataframe from scratch using vectors
fruits = c("apple", "banana", "mango", "grape", "kiwi")
ranks = c(5,4,3,1,2)
fruit_ranks = data.frame(fruits, ranks)

# create tibble from existing dataset
tibble(diamonds)

# read dataset
read_csv(readr_example("mtcars.csv"))

# read excel file
library(readxl)
read_excel(readxl_example("type-me.xlsx"))
excel_sheets(readxl_example("type-me.xlsx"))

# read csv file
bookings_df <- read_csv("hotel_bookings.csv")
head(bookings_df)
str(bookings_df)
glimpse(bookings_df)
colnames(bookings_df)

new_df <- select(bookings_df, `adr`, adults)
mutate(new_df, total = adr / adults)
