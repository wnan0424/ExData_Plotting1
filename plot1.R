
library(dplyr)
library(lubridate)

aa <- read.csv("household_power_consumption.txt",sep = ";", header = T,na.strings="?")
data <- filter(aa, Date == c("1/2/2007", "2/2/2007"))
data$Date <- dmy(data$Date)
data <- mutate(data, wholetime = ymd_hms(paste(data$Date,data$Time,sep = " ")))
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot 1 
hist(data$Global_active_power, main= "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

