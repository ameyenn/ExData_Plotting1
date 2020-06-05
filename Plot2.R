library(data.table)
library(lubridate) #ref https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_lubridate.pdf

df<-fread("household_power_consumption.txt", na.strings="?")  #use fast read, could add more parameters
df <- subset(df, Date %in% c("1/2/2007","2/2/2007")) #subset to desired range
dateTime <- dmy_hms(paste(df$Date, df$Time)) #this is the difficult concept, new date and time variable

png("plot2.png", width=480, height=480) #open the png ploting

  plot(dateTime, as.numeric(df$Global_active_power),type = "l",  ylab = "Global Active Power (kilowatts)",, xlab = "")

dev.off() #close Plot
























