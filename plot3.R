#Rod LE
#data extract from local env
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting data again
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#grab columns
#vectors for ploting
Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

#plotting and plot managing
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

#legends and lines
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
