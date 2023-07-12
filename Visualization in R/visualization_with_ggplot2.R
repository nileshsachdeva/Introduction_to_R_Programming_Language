install.packages("ggplot2")
install.packages("palmerpenguins")

library(ggplot2)
library(palmerpenguins)

# ----- penguins dataset -----
data("penguins")
View(penguins)

# create empty plot
ggplot(data=penguins)

# add layers - scatterplot
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x = bill_length_mm, y = bill_depth_mm))

# add color to represent different categories
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))

# add color and shape to represent different categories
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species))

# add color, shape and size to represent different categories
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species, size = species))

# add density or transparency to represent different categories
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha = species))

# represent all data by some other color - color parameter will sit outside aes() function and inside geom function
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), color="purple")

# represent all data by a smooth line
ggplot(data=penguins) + 
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# combining trend line and scatter points
ggplot(data=penguins) + 
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# separate line for each category
ggplot(data=penguins) + 
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype = species))

# geom_jitter() function – create a scatter plot and then add a small amount of random noise to each point in the plot. 
# Jittering helps us deal with over-plotting, which happens when the data points in a plot overlap with each other. Jittering makes the points easier to find.
ggplot(data=penguins) + 
  geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# bar chart - with diamonds dataset
ggplot(data=diamonds) + 
  geom_bar(mapping = aes(x = cut))

# add color to boundary to bars to represent each category in bar chart
ggplot(data=diamonds) + 
  geom_bar(mapping = aes(x = cut, color=cut))

# add color to fill the bars to represent each category in bar chart
ggplot(data=diamonds) + 
  geom_bar(mapping = aes(x = cut, fill=cut))

# stacked bar chart by adding another category
ggplot(data=diamonds) + 
  geom_bar(mapping = aes(x = cut, fill=clarity))


# FACETING - create separate plot for each category

# penguins dataset
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  facet_wrap(~species)

# diamonds dataset
View(diamonds)
ggplot(data=diamonds) + 
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~cut)

# facet by 2 variables
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  facet_grid(sex~species)

# facet_grid() works with 1 variable as well, to allow focus on a single variables' categories
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  facet_grid(~species)

ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  facet_grid(~sex)


# add title, subtitle, caption, annotation
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label="Gentoos are the largest")

# changing color and style of annotation
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label="Gentoos are the largest", color="purple", fontface="bold", size=4.5, angle=25)

# storing graph as variable and adding annotation to it
p <- ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman")

p + annotate("text", x=220, y=3500, label="Gentoos are the largest", color="purple", fontface="bold", size=4.5, angle=25)


# save file using ggsave()
ggsave("img_saved_using_ggsave.png")



# ----- PRACTICE - hotel_bookings dataset -----
hotel_bookings <- read.csv("hotel_bookings.csv")
View(hotel_bookings)

# hypothesis: people with children have to book in advance - TRUE or FALSE?
ggplot(data = hotel_bookings) + 
  geom_point(mapping = aes(x = lead_time, y = children))

# hypothesis: guests without children book the most weekend nights
ggplot(data = hotel_bookings) + 
  geom_point(mapping = aes(x = stays_in_weekend_nights, y = children))

# how many of the transactions are occurring for each different distribution type?
ggplot(data=hotel_bookings) + 
  geom_bar(aes(x=distribution_channel))

# Do the number of bookings for each distribution type is different depending on whether or not there was a deposit or what market segment they represent.
ggplot(data=hotel_bookings) + 
  geom_bar(aes(x=distribution_channel, fill=deposit_type))

ggplot(data=hotel_bookings) + 
  geom_bar(aes(x=distribution_channel, fill=market_segment))

# create separate charts for each deposit type and market segment
ggplot(data=hotel_bookings) + 
  geom_bar(aes(x=distribution_channel)) + 
  facet_wrap(~deposit_type)

ggplot(data=hotel_bookings) + 
  geom_bar(aes(x=distribution_channel)) + 
  facet_wrap(~market_segment)

# add code at the end that rotates the text to 45 degrees to make it easier to read
ggplot(data = hotel_bookings) +
  geom_bar(aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = hotel_bookings) +
  geom_bar(aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# using facet_grid()
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# filtering data for plotting
# create a plot that shows the relationship between lead time and guests traveling with children for online bookings at city hotels
library(tidyverse)
library(dplyr)
onlineta_cityhotels <- hotel_bookings %>% 
  filter(hotel=="City Hotel" & market_segment=="Online TA")

View(onlineta_cityhotels)

ggplot(onlineta_cityhotels) + 
  geom_point(aes(x=lead_time, y=children))

# Based on your previous filter, this scatterplot shows data for online bookings for city hotels. 
# The plot reveals that bookings with children tend to have a shorter lead time, and bookings with 3 children have a significantly shorter lead time (<200 days). 
# So, promotions targeting families can be made closer to the valid booking dates.

# using pipe for filtering and plotting
hotel_bookings %>% 
  filter(hotel=="City Hotel" & market_segment=="Online TA") %>% 
  ggplot() + geom_point(aes(x=lead_time, y=children))

# onlineta_city_hotels_v2 <- hotel_bookings %>%
#   filter(hotel=="City Hotel") %>%
#   filter(market_segment=="Online TA")
# 
# View(onlineta_city_hotels_v2)

# annotating the chart
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) + 
  labs(title="Count of Market Segment")

# adding dynamic subtitle/caption using paste0() function
min_date <- min(hotel_bookings$arrival_date_year)
max_date <- max(hotel_bookings$arrival_date_year)

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) + 
  labs(title="Count of Market Segment",
       subtitle=paste0("Data from ", min_date, " to ", max_date))

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) + 
  labs(title="Count of Market Segment",
       caption=paste0("Data from ", min_date, " to ", max_date),
       x="Market Segment", y="No. of Bookings")

ggsave("bookings_by_market_segment.png", width=16, height=8)


