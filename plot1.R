##Download latest data and save it as "HPC.txt" in the working directory. 

##Read in the full data set from where you have downloaded it; use ";" as the 
## separator and read in any "?" values as NAs
fileLocation <- "HPC.txt"
fullData <- read.table(fileLocation, header = TRUE, sep = ";", na.strings="?")

##subset for desired dates
desiredData <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")

##force the desired data to be numeric
GAP <- as.numeric(desiredData$Global_active_power)

##generate plot 1 as a png
##hist(GAP, col= "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

png(file = "plot1.png")
hist(GAP, col= "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()