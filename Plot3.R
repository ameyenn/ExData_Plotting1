library(data.table)
library(lubridate) #ref https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_lubridate.pdf

df<-fread("household_power_consumption.txt", na.strings="?")  #use fast read, could add more parameters
df <- subset(df, Date %in% c("1/2/2007","2/2/2007")) #subset to desired range
dateTime <- dmy_hms(paste(df$Date, df$Time)) #reuse the new data time variable
#Change Sub metering variables to numeric

sm1<-as.numeric(df$Sub_metering_1)
sm2<-as.numeric(df$Sub_metering_2)
sm3<-as.numeric(df$Sub_metering_3)

png("plot3.png", width=480, height=480) #open the png ploting
plot(dateTime, sm1,type = "l",  ylab = "Energy Sub Metering",, xlab = "")
lines(dateTime, sm2, type = "l", col="Red") #add to the plot
lines(dateTime, sm3, type="l", col="Blue")  #add to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() #close Plot





