setwd("D:/coursera/exploratory data analysis/course project 1")
powerdata <- read.table("household_power_consumption.txt", nrows=100000, 
                        header=TRUE, sep=";", na.string="?")
library(dplyr)
powerdata <- filter(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
hist(powerdata$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()