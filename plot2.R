setwd("D:/coursera/exploratory data analysis/course project 1")
powerdata <- read.table("household_power_consumption.txt", nrows=100000, 
                        header=TRUE, sep=";", na.string="?")
library(dplyr)
powerdata <- filter(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), 
                     "%Y-%m-%d %H:%M:%S")
powerdata <- cbind(powerdata, datetime)
with(powerdata, plot(datetime, Global_active_power, type="l", 
                     xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()