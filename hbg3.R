## hbg3.R
## clone of hbg1.R
## Haden's Blood Glucose data
## Aug 14 2012

hbg$hour = round(hbg$Timestamp, "hour")

glucose.its = zoo(hbg$Sensor.Glucose..mg.dL., order.by=hbg$Timestamp)
hbg.hour = seq(first(hbg$Timestamp), last(hbg$Timestamp), by="hour")

glucose.ts = merge(glucose.its,hbg.hour)