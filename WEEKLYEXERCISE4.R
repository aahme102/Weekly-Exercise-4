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