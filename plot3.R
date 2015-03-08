library(data.table)
## setup: Download and extract the data from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Put the file: household_power_consumption.txt into the R working directory

## read data into work space
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
head(data)

## extract the data for plotting
dataPlots <- subset(data,Date=="2/2/2007" | Date=="1/2/2007")
dataPlots$Date=strptime(paste(dataPlots$Date,dataPlots$Time),"%d/%m/%Y %H:%M:%S")
## DayofWeek <- weekdays(as.Date(dataPlots$Date), abbreviate=TRUE)

dataPlots$Global_active_power=as.numeric(dataPlots$Global_active_power)

## create png device
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

plot(dataPlots$Date, dataPlots$Sub_metering_1, 
     pch=".", 
     main = "", 
     xlab = "",
     ylab = "Energy sub metering",
     col ="black")
lines(dataPlots$Date, dataPlots$Sub_metering_1, col ="black")
lines(dataPlots$Date, dataPlots$Sub_metering_2, col ="red")
lines(dataPlots$Date, dataPlots$Sub_metering_3, col ="blue")
legend("topright", 
       pch = 1, 
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
