## hbg1.R
## data import/cleaning script
## Haden's Blood Glucose data
## Aug 12 2012

rm(list = ls())
require(TTR)
require(its)
require(pastecs)
require(zoo)

hbg = read.csv("All_Hayden_Data_R2/All_Hayden_Data_R2.csv", skip=11, header=TRUE)
hbg$Timestamp = strptime(hbg$Timestamp, format="%m/%d/%Y %H:%M")
#hbg$Time = strptime(hbg$Time, format="%H:%M")  # Converting to POSIX adds a date. This is more useful as a factor
hbg$Date = strptime(hbg$Date, format="%m/%d/%Y")

hbg.ss = subset(hbg, subset=hbg$Index%in%sample(hbg$Index, 4000), select=c("Date", "Time","Timestamp", "Sensor.Glucose..mg.dL.", "BWZ.Carb.Input..grams.", "BG.Reading..mg.dL.", "Bolus.Volume.Delivered..U.", "Bolus.Volume.Selected..U."))
hbg.day = subset(hbg, subset=hbg$Date==hbg$Date[190000], select=c("Date", "Time","Timestamp", "Sensor.Glucose..mg.dL.", "BWZ.Carb.Input..grams.", "BG.Reading..mg.dL.", "Bolus.Volume.Delivered..U.", "Bolus.Volume.Selected..U."))

glucose.day = its(hbg.day$Sensor.Glucose..mg.dL., dates=hbg.day$Timestamp)

glucose.ss = its(hbg.ss$Sensor.Glucose..mg.dL., dates=hbg.ss$Timestamp)
carb.ss = its(hbg.ss$BWZ.Carb.Input..grams., dates=hbg.ss$Timestamp)
insulin.ss = its(hbg.ss$Bolus.Volume.Delivered..U., dates=hbg.ss$Timestamp)

tr = function(){
     abline(h=80, lty=2, col=2)
     abline(h=140, lty=2, col=2)
     }

tmp = as.ts(SMA(locf(glucose.day)))
tmp.tp = turnpoints(na.omit(tmp))