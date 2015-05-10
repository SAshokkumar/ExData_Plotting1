
#reading file data
file_data <- read.table(file="../household_power_consumption.txt", header=TRUE, sep=";",
                        colClasses=c("character","character",rep("numeric",7)), na="?")

#selecting subset of data based on specific dates
file_data$Time <- strptime(paste(file_data$Date, file_data$Time), "%d/%m/%Y %H:%M:%S")
file_data$Date <- as.Date(file_data$Date, format="%d/%m/%Y")
data <- subset(file_data, Date>="2007-02-01" & Date <= "2007-02-02")
rm(file_data)

#plotting
plot(data$Time, data$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)

#copying to png file
dev.copy(png, file="plot3.png", height=460, width=460)
dev.off()