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
GloReaPow <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

# Creating graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(datetime, GloActPow, , type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(datetime, voltage, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(datetime, SubMet1, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(datetime, SubMet2, col='Red')
  lines(datetime, SubMet3, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("SubMet1", "SubMet2", "SubMet3"),
         text.width = strwidth("50,000"), y.intersp = 0.2,
         xjust = 0.5, yjust = 0.5, x.intersp = 0.5)
  plot(datetime, GloReaPow, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")})

## Saving to file
dev.copy(png, file="Plot4.png", height=480, width=480)
png(file = "myplot.png", bg = "transparent")
dev.off()
