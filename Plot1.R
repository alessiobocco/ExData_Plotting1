# Loading data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subseting data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting variables
GloActPow <- as.numeric(subSetData$Global_active_power)

## Creating Histogram
hist(GloActPow, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
