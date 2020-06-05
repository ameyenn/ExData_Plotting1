
library(data.table)
library(lubridate) #ref https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_lubridate.pdf
#ref ploting and lines http://www.sthda.com/english/wiki/line-plots-r-base-graphs

df<-fread("household_power_consumption.txt", na.strings="?")  #use fast read, could add more parameters
df <- subset(df, Date %in% c("1/2/2007","2/2/2007")) #subset to desired range
dateTime <- dmy_hms(paste(df$Date, df$Time)) #reuse the new data time variable

png("plot4.png", width=480, height=480)

  par(mfrow = c(2, 2)) #set 2 by 2 grid patteren.

  #plot in order

  plot(datetime, as.numeric(df$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

  plot(datetime, as.numeric(df$Voltage), type="l", xlab="datetime", ylab="Voltage")

  plot(datetime,as.numeric(df$Sub_metering_1) , type="l", ylab="Energy submeter", xlab="")
  lines(datetime,as.numeric(df$Sub_metering_2) , type="l", col="red")
  lines(datetime,as.numeric(df$Sub_metering_3) , type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

  plot(datetime, as.numeric(df$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()