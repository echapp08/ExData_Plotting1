##Download latest data and save it as "HPC.txt" in the working directory. 

##Read in the full data set from where you have downloaded it; use ";" as the 
## separator and read in any "?" values as NAs
fileLocation <- "HPC.txt"
fullData <- read.table(fileLocation, header = TRUE, sep = ";", na.strings="?")

##subset for desired dates
desiredData <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

##generate a column in the data set that is the date and time
desiredData$DT <-strptime( paste(desiredData$Date,desiredData$Time), format="%d/%m/%Y %H:%M:%S")



##generate plot 3 as a png
png(file = "plot3.png")

plot (desiredData$DT,desiredData$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines (desiredData$DT,desiredData$Sub_metering_2,type = "l", col = "red")
lines (desiredData$DT,desiredData$Sub_metering_3,type = "l", col = "blue")

## place a legend in the top right, with lines for indicators, with the correct
## colors and labels
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

