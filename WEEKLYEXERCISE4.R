# 4. Create a new R Script “WEEKLYEXERCISE4” and check the name of the default branch.Report the name as a comment in the R Script. [Hint: install and load the relevant package] (6pts)

The name of the Default Branch is "main"

# Ran git2r as it provides access to repositories
install.packages("git2r")
library(git2r)

# Asked Chatgpt for clarification on the steps below:
repo = repository(".")


name_branch = repository_head(repo)$name

name_branch

library(readr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

olympics_data <- read.csv("Olympics.csv")

# Question 6

# 6a. Calculate a new variable, called ‘total.medals’, which is the sum of gold, silver, and bronze, and add it to the Olympic dataset. (2pts)

olympics_data1a = olympics_data %>%
  mutate(total.medals = sum(gold + silver + bronze, na.rm = TRUE)) 
  
# 6b. For each country, how many gold medals has it won? (2pts)

by_country_gold = olympics_data1a %>%
  group_by(country) %>%
  summarise(gold_won = sum(gold, na.rm = T)) 
  
# 6c. For each year, how many total medals were given out? (2pts)

by_year_totmedals <- olympics_data1a %>%
  group_by(year) %>%
  summarise(yearly_totmedals = sum(total.medals, na.rm = T))
  

# 7. Go to the main branch and use the same “Olympics.csv” dataset to answer the following questions. Write your code in the previously created “WEEKLYEXERCISE4” R Script.

olympics_data <- read.csv("Olympics.csv")

# a. Which countries had the largest delegation of athletes in 1992? Create a tibble that contains only the variables country and athletes. (2pts)

largest_delegation_1992 = olympics_data %>%
  filter(year == 1992) %>%
  select(country, athletes) %>%
  arrange(desc(athletes))

# b. For the following five countries, plot the number of gold medals earned over time:United States, France, Germany, Russia, and China. (4pts)

countries = c("United", "France", "Germany", "Russia", "China")

selected_countries = olympics_data %>%
  filter(str_detect(country, str_c(countries, collapse = "|")))

gold_by_year = selected_countries %>%
  group_by(country, year) %>%
  summarize(total_gold = sum(gold, na.rm = TRUE)) %>%
  ungroup()

ggplot(gold_by_year, aes(x = year, y = total_gold, color = country)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Gold Medals Over The Years",
    x = "Year",
    y = "Number of Gold Medals",
    color = "Country"
  ) +
  theme_minimal()




