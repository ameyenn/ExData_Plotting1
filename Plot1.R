library(data.table)

df<-fread("household_power_consumption.txt", na.strings="?")  #use fast read, could add more parameters

df <- subset(df, Date %in% c("1/2/2007","2/2/2007")) #subset to desired range

png("plot1.png", width=480, height=480) #open the png ploting
 
hist(df$Global_active_power, col="red", main = "Main Active Power", xlab = "Global Active Power (kilowatts)") #create histogram

dev.off() #close Plot

