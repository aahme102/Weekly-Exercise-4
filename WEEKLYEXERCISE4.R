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
  


  

