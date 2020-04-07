# project: covid-19 desktop forecast deviations for mozilla firefox 
# ref url: https://blog.mozilla.org/data/2020/03/30/opening-data-to-understand-social-distancing/
# date: 2020-03-31
# id: ji

# housekeeping -----------------------------------------------------------
setwd("~/Mozilla FireFox")

library(tidyverse)
library(lubridate)
library(tidyquant) 
library(fpp2)

# note that firefox updates daily; at least for covid-19 duration
# to replicate code, a better approach is to load the attached .csv file
# otherwise, for updated data, download from firefox and edit code as necessary
fox1 <- read.csv("https://docs.google.com/spreadsheets/d/1jHWW9QYAOCNTVwyWF29YiVGDf4uX3TcLgREVrQ1bkHI/export?format=csv")
write.csv(fox1, "fox1.csv")

fox1 %>% 
  select(date, deviation) %>% 
  head(n = 10)

# find length of time (in days) data was captured by FireFox?
# first convert factor var to as.POSIXct; note: timezone = EST
fox1$date <- as.POSIXct(fox1$date)
head(fox1$date)
difftime(max(fox1$date), min(fox1$date), units = c("days")) 

# var definitions ------------------------------------------------- 
# extract country iso from "geography" var and recode as ctry_iso
fox1$ctry_iso <- substr(fox1$geography, start = 1, stop = 2)
fox1 %>% 
  head()

# note: 92 obs. are assigned "??" geography
# drop obs with ctry_iso=="??"
fox1 <- fox1[!fox1$ctry_iso =="??",]
fox1 %>% 
  select(date, deviation, geography, ctry_iso) %>% 
  group_by(ctry_iso) %>% 
  arrange(ctry_iso) %>%
  print(n = 10)

# to reconfirm:
# note: 195-(102+10) = 81 UN member states unaccounted for in dataset
fox1 %>% 
  count(ctry_iso)

# plotting timeseries --------------------------------------------------------------
# converts to timeseries
# "end" in line below refers to number of days data was collected 
# as calculated using base R difftime above = 64 as at press time
y_all <- ts(fox1$deviation, start = c(1), end = c(64), frequency = 1) 
autoplot(y_all) +
  xlab ("Jan. 31st - Apr. 5th") +
  ylab("Deviation") +
  scale_x_continuous(breaks = 1:64) +
  ggtitle("Firefox Desktop Deviation - Globally")

# usa
head(fox1$deviation[fox1$ctry_iso=="US"])
y_usa <- ts(fox1$deviation[fox1$ctry_iso=="US"], start = c(1), end = c(64), frequency = 1)
autoplot(y_usa) +
  xlab("Jan. 31st - Apr. 5th") +
  ylab("Deviation") +
  scale_x_continuous(breaks = 1:64) +
  ggtitle("Firefox Desktop Deviation in USA")
# fix(y_usa) # inspect

# canada
head(fox1$deviation[fox1$ctry_iso=="CA"])
y_cdn <- ts(fox1$deviation[fox1$ctry_iso=="CA"], start = c(1), end = c(64), frequency = 1)
autoplot(y_cdn) +
  xlab("Jan. 31st - Apr. 5th") +
  ylab("Deviation") +
  scale_x_continuous(breaks = 1:64) +
  ggtitle("Firefox Desktop Deviation in Canada")
# fix(y_cdn) # inspect

# france
head(fox1$deviation[fox1$ctry_iso=="FR"])
y_fr <- ts(fox1$deviation[fox1$ctry_iso=="FR"], start = c(1), end = c(64), frequency = 1)
autoplot(y_fr) +
  xlab("Jan. 31st - Apr. 5th") +
  ylab("Deviation") +
  scale_x_continuous(breaks = 1:64) +
  ggtitle("Firefox Desktop Deviation in France")

# nigeria
head(fox1$deviation[fox1$ctry_iso=="NG"])
y_ng <- ts(fox1$deviation[fox1$ctry_iso=="NG"], start = c(1), end = c(64), frequency = 1)
autoplot(y_ng) +
  xlab("Jan. 31st - Apr. 5th") +
  ylab("Deviation") +
  scale_x_continuous(breaks = 1:64) +
  ggtitle("Firefox Desktop Deviation in Nigeria")

# south africa
head(fox1$deviation[fox1$ctry_iso=="ZA"])
y_za <- ts(fox1$deviation[fox1$ctry_iso=="ZA"], start = c(1), end = c(64), frequency = 1)
autoplot(y_za) +
  xlab("Jan. 31st - Apr. 5th") +
  ylab("Deviation") +
  scale_x_continuous(breaks = 1:64) +
  ggtitle("Firefox Desktop Deviation in South Africa")

# kenya
# preference is for rwanda comparison but rwanda not captured in dataset
head(fox1$deviation[fox1$ctry_iso=="KE"])
y_ke <- ts(fox1$deviation[fox1$ctry_iso=="KE"], start = c(1), end = c(64), frequency = 1)
autoplot(y_ke) +
  xlab("Jan. 31st - Apr. 5th") +
  ylab("Deviation") +
  scale_x_continuous(breaks = 1:64) +
  ggtitle("Firefox Desktop Deviation in Kenya")

# end script -------------------------------------