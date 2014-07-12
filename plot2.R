##Download latest data and save it as "HPC.txt" in the working directory. 

##Read in the full data set from where you have downloaded it; use ";" as the 
## separator and read in any "?" values as NAs
fileLocation <- "HPC.txt"
fullData <- read.table(fileLocation, header = TRUE, sep = ";", na.strings="?")

##subset for desired dates
desiredData <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

##generate a column in the data set that is the date and time
desiredData$DT <-strptime( paste(desiredData$Date,desiredData$Time), format="%d/%m/%Y %H:%M:%S")


##generate plot 2 as a png
png(file = "plot2.png")
with(desiredData, plot(DT, Global_active_power, type="l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()



