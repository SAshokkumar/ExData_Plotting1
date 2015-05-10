
#reading file data
file_data <- read.table(file="../household_power_consumption.txt", header=TRUE, sep=";",
                        colClasses=c("character","character",rep("numeric",7)), na="?")

#selecting subset of data based on specific dates
file_data$Time <- strptime(paste(file_data$Date, file_data$Time), "%d/%m/%Y %H:%M:%S")
file_data$Date <- as.Date(file_data$Date, format="%d/%m/%Y")
data <- subset(file_data, Date>="2007-02-01" & Date <= "2007-02-02")
rm(file_data)

#plotting
par(mfrow=c(2,2))
# pic 1
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# pic 2
plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# pic 3
plot(data$Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

# pic 4
plot(data$Time, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$Time, data$Global_reactive_power)

#copying to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()