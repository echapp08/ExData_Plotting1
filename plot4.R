##Download latest data and save it as "HPC.txt" in the working directory. 

##Read in the full data set from where you have downloaded it; use ";" as the 
## separator and read in any "?" values as NAs
fileLocation <- "HPC.txt"
fullData <- read.table(fileLocation, header = TRUE, sep = ";", na.strings="?")

##subset for desired dates
desiredData <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

##generate a column in the data set that is the date and time
desiredData$DT <-strptime( paste(desiredData$Date,desiredData$Time), format="%d/%m/%Y %H:%M:%S")



##generate plot 4 as a png
png(file = "plot4.png")

par(mfrow = c(2,2))

## Plot1
with(desiredData, plot(DT, Global_active_power, type="l", xlab = " ", ylab = "Global Active Power"))


## Plot 2
with(desiredData, plot(DT, Voltage, xlab ="datetime", ylab = "Voltage", type = "l"))

## Plot 3
plot (desiredData$DT,desiredData$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines (desiredData$DT,desiredData$Sub_metering_2,type = "l", col = "red")
lines (desiredData$DT,desiredData$Sub_metering_3,type = "l", col = "blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## Plot 4
with(desiredData, plot(DT, Global_reactive_power, xlab ="datetime", ylab = "Global_reactive_power", type = "l"))

dev.off()

