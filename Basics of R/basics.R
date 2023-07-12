# installing packages
install.packages("tidyverse")

# loading libraries
library(tidyverse)
library(lubridate)
install.packages("palmerpenguins")
library(palmerpenguins)

# Get summary of data
summary(penguins)

# View data
View(penguins)
View(penguins)

# Scatterplot
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species))
print("Coding in R")

#Help for any function
?print()
# Details will appear in the help window

# Here's an example of variables and Assignment operator
first_variable <- "This is my variable"
second_variable <- 12.5

# Vector
vec_1 <- c(13, 48.5, 71, 101.5, 2)
vec_1

# Naming elements of Vector
x <- c(1, 3, 5)
names(x) <- c("a", "b", "c")
x

# Naming lists
str(list("a", 1L, 1.5, TRUE))
z <- list(list(list(1 , 3, 5)))
str(z)

# Dataframe
data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))
matrix(c(3:8), nrow = 2)
matrix(c(3:8), ncol = 2)

