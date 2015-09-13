#Rod LE
#grab text file from source
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset data
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date <- strptime(paste(subdata$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#grab column Global_active_power
Global_active_power <- as.numeric(subdata$Global_active_power)

#create plot
png("plot2.png", width=480, height=480)
plot(date, Global_active_power, type="l", xlab="", ylab="Global Active Power - kilowatts")
