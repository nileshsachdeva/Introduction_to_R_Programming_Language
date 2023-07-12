install.packages("here")
library(here)

install.packages("skimr")
library(skimr)

install.packages("janitor")
library(janitor)

library(dplyr)

install.packages("palmerpenguins")
library("palmerpenguins")

skim_without_charts(penguins)
glimpse(penguins)
head(penguins)

# select
penguins %>% 
  select(-species)

# rename columns to upper/lower case
penguins %>% 
  rename(island_new = island)

rename_with(penguins, toupper)

rename_with(penguins, tolower)

# ----- organizing data -----
library(tidyverse)

# arrange in ascending order
penguins %>% arrange(bill_length_mm)

# arrange in descending order
penguins %>% arrange(-bill_length_mm)

penguins2 <- penguins %>% arrange(-bill_length_mm)
View(penguins2)

# group by categories and mean
penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(mean_bill_length_mm = mean(bill_length_mm))

# group by categories and max
penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(max_bill_length_mm = max(bill_length_mm))

# multiple group by categories and multiple summarize
penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>% 
  summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

# filter
penguins %>% filter(species == "Adelie")


# ----- cleaning and organizing hotel bookings data -----
bookings_df <- read_csv("hotel_bookings.csv")
head(bookings_df)
str(bookings_df)
glimpse(bookings_df)
colnames(bookings_df)

skim_without_charts(bookings_df)

# cleaning
trimmed_df <- bookings_df %>% select(hotel, is_canceled, lead_time)

trimmed_df %>% 
  rename(hotel_type = hotel)

# combine 2 or more columns into 1 column
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")

head(example_df)

# create calculated column
example_df <- bookings_df %>%
  mutate(guests = adults+children+babies)

head(example_df)
colnames(example_df)

# Calculate the total number of canceled bookings and the average lead time for booking
example_df <- bookings_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  group_by(hotel) %>% 
  summarize(number_canceled = sum(is_canceled), avg_lead_time = mean(lead_time))

num_canceled <- example_df %>% summarize(sum(number_canceled))
print(num_canceled)

# ------------------

hotel_bookings <- read_csv("hotel_bookings.csv")
head(hotel_bookings)

hotel_bookings %>% arrange(-lead_time)

hotel_bookings_v2 <- arrange(hotel_bookings, desc(lead_time))
head(hotel_bookings_v2)

max(hotel_bookings$lead_time)
min(hotel_bookings$lead_time)

min(lead_time) # gives error due to syntax, syntax is <dataset> $ <column-name>

mean(hotel_bookings$lead_time)

# avg lead time for major cities
bookings_city <- filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")
mean(bookings_city$lead_time)

hotel_summary <- hotel_bookings %>% 
  group_by(hotel) %>%
  summarise(average_lead_time=mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))

head(hotel_summary)














