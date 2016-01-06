# 1. Read data from working directory

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# 2. Convert Date to Date classes and select range of dates

data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# 3. Merge Data and Time in a new variable (column)

subdata$date.time <- strptime(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")

# 4. Plot in a png

png("plot3.png", width = 480, height = 480)
plot(subdata$date.time,subdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(subdata$date.time, subdata$Sub_metering_2, col = "red", type = "l")
lines(subdata$date.time, subdata$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = c(1, 1, 1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()