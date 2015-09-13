#Rod LE
#extracting data from file on local environment
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting data
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#getting columns needed
Global_active_power <- as.numeric(subdata$Global_active_power)
Global_reactive_power <- as.numeric(subdata$Global_reactive_power)

#JOLTEON! (voltage - pokemon reference) ignore comment if not funny
voltage <- as.numeric(subdata$Voltage)
Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

#plotting and plot managing
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
