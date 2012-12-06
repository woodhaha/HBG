## hbg2.R
## clone of hbg1.R
## loads the data
## Haden's Blood Glucose data
## Aug 14 2012
rm(list = ls())

setwd("~/Work/HBG/")
require(TTR)
require(its)
require(pastecs)
require(zoo)


hbg = read.csv("All_Hayden_Data_R2/All_Hayden_Data_R2.csv", skip=11, header=TRUE)
hbg$Timestamp = strptime(hbg$Timestamp, format="%m/%d/%Y %H:%M")
#hbg$Time = strptime(hbg$Time, format="%H:%M")  # Converting to POSIX adds a date. This is more useful as a factor
hbg$Date = strptime(hbg$Date, format="%m/%d/%Y")

