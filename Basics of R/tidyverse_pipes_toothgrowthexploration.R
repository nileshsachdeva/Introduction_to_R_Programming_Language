install.packages("tidyverse")

library("tidyverse")

browseVignettes("tidyverse") # opens in new window
browseVignettes("ggplot2")

# ---------------------------------------------------

# Tooth Growth Data Exploration

data("ToothGrowth")

View(ToothGrowth)

install.packages("dplyr")
library(dplyr)

filtered_tg <- filter(ToothGrowth, dose==0.5)
View(filtered_tg)

arrange(filtered_tg, len)

# doing filter and sort using nested function
arrange(filter(ToothGrowth, dose==0.5), len)

# pipe
filtered_toothgrowth <- ToothGrowth %>% 
  filter(dose==0.5) %>% 
  arrange(len)

filtered_toothgrowth
View(filtered_toothgrowth)

# find avg toothlength for each suppliment category - using pipe
filtered_toothgrowth <- ToothGrowth %>% 
  filter(dose==0.5) %>%
  group_by(supp) %>% 
  summarize(mean_len = mean(len, na.rm = T), .group="drop")

View(filtered_toothgrowth)