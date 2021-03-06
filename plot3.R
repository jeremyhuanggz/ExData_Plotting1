setwd("D:/coursera/exploratory data analysis/course project 1")
powerdata <- read.table("household_power_consumption.txt", nrows=100000, 
                        header=TRUE, sep=";", na.string="?")
library(dplyr)
powerdata <- filter(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), 
                     "%Y-%m-%d %H:%M:%S")
powerdata <- cbind(powerdata, datetime)
png(filename="plot3.png", width=480, height=480)
with(powerdata, plot(datetime,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(powerdata, lines(datetime, Sub_metering_1, col="black"))
with(powerdata, lines(datetime, Sub_metering_2, col="red"))
with(powerdata, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()