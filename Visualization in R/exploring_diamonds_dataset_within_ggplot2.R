library(tidyverse)

# Display the columns and the first several rows of data
head(diamonds)

# Summary of each column in your data arranged horizontally
str(diamonds)
glimpse(diamonds)

# List of column names in dataset 
colnames(diamonds)

# Rename column
rename(diamonds, carat_new = carat, cut_new = cut)

# Summary statistics
summarize(diamonds, mean_carat = mean(carat))

# Visualization with ggplot2()
# To build a visualization with `ggplot2` you layer plot elements together with a `+` symbol.
# Scatterplot
ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point()
# Show data categories with colors
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_point()
# Separate out data for each category
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_point() + facet_wrap(~cut)

