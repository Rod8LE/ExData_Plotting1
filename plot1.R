#grab text file from source
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset data
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#grab column Global_active_power
Global_active_power <- as.numeric(subdata$Global_active_power)

#create plot
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
