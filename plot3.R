
library(dplyr)
library(lubridate)

aa <- read.csv("household_power_consumption.txt",sep = ";", header = T,na.strings="?")
data <- filter(aa, Date == c("1/2/2007", "2/2/2007"))
data$Date <- dmy(data$Date)
data <- mutate(data, wholetime = ymd_hms(paste(data$Date,data$Time,sep = " ")))
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot 3 
with(data, plot(wholetime, Sub_metering_1, type = "l", col = "black",xlab="", ylab="Energy sub metering"))
points(data$wholetime,data$Sub_metering_2, type = "l",col = "red")
points(data$wholetime,data$Sub_metering_3,type = "l" , col = "blue")
legend("topright", col = c("black","red","blue"), lwd=c(1,1,1),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
