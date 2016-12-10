# Loading data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subseting data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Converting data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GloActPow <- as.numeric(subSetData$Global_active_power)

# Creating Graph
plot(datetime, GloActPow, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Saving to file
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()
