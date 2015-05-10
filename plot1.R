
#reading file data
file_data <- read.table(file="../household_power_consumption.txt", header=TRUE, sep=";", 
                        colClasses=c("character","character",rep("numeric",7)), na="?")

#selecting subset of data based on specific dates
file_data$Date <- as.Date(file_data$Date, format="%d/%m/%Y")
data <- subset(file_data, Date>="2007-02-01" & Date <= "2007-02-02")
rm(file_data)
dates <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(dates)

#plotting
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#copying to png file
dev.copy(png, file="plot1.png", height=460, width=460)
dev.off()