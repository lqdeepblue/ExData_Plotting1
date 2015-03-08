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
dataPlots$Global_reactive_power=as.numeric(dataPlots$Global_reactive_power)
dataPlots$Voltage=as.numeric(dataPlots$Voltage)
dataPlots$Sub_metering_1=as.numeric(dataPlots$Sub_metering_1)
dataPlots$Sub_metering_2=as.numeric(dataPlots$Sub_metering_2)
dataPlots$Sub_metering_3=as.numeric(dataPlots$Sub_metering_3)

## create png device
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(mfrow = c(2, 2))

## topLeft graph
plot(dataPlots$Date, dataPlots$Global_active_power, 
     pch=".", 
     main = "", 
     xlab = "",
     ylab = "Global Active Power(kilowatts)",
     col ="black")
lines(dataPlots$Date, dataPlots$Global_active_power,col ="black")

## topRight graph
plot(dataPlots$Date, dataPlots$Voltage, 
     pch=".", 
     main = "", 
     xlab = "datetime",
     ylab = "Voltage",
     col ="black")
lines(dataPlots$Date, dataPlots$Voltage,col ="black")


## bottomLeft graph
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

## bottomRight graph
plot(dataPlots$Date, dataPlots$Global_reactive_power, 
     pch=".", 
     main = "", 
     xlab = "datetime",
     ylab = "Global_reactive_power",
     col ="black")
lines(dataPlots$Date, dataPlots$Global_reactive_power,col ="black")

dev.off()
