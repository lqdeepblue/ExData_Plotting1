
## setup: Download and extract the data from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Put the file: household_power_consumption.txt into the R working directory

## read data into work space
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
head(data)

## extract the data for plotting
dataPlots <- subset(data,Date=="2/2/2007" | Date=="1/2/2007")
dataPlots$Global_active_power=as.numeric(dataPlots$Global_active_power)

## create png device
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
with(dataPlots, hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency"))
dev.off()
