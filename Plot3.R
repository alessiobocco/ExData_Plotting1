# Loading data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subseting data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Converting data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GloActPow <- as.numeric(subSetData$Global_active_power)
SubMet1 <- as.numeric(subSetData$Sub_metering_1)
SubMet2 <- as.numeric(subSetData$Sub_metering_2)
SubMet3 <- as.numeric(subSetData$Sub_metering_3)

# Creating Graph
with(subSetData, {
  plot(datetime, SubMet1, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(datetime, SubMet2,col='Red')
  lines(datetime, SubMet3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("SubMet1", "SubMet2", "SubMet3"),
       text.width = strwidth("100,000"))

# Saving to file
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()
