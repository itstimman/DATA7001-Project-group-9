setwd("C:/Users/markm/OneDrive/University/2021 Semester 2/DATA7001/Project")
rm(list=ls())

# Firstly, install the below packages:
# install.packages("rtweet")
# install.packages("tidyverse")
# install.packages("tidytext")

# load twitter library - the rtweet library is recommended now over twitteR
library(rtweet)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)
# plotting packages
library(igraph)
library(ggraph)

coronatweets <- search_tweets(q = "#corona #covid", 
                                n = 1000,
                                lang = "en",
                                include_rts = FALSE)

# After running command for first time, will prompt login to Twitter

coronatweets <- apply(coronatweets, 2, as.character)

write.csv(coronatweets, "coronatweets.csv", row.names = FALSE)
