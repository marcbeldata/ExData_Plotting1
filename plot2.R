# 1. Read data from working directory

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# 2. Convert Date to Date classes and select range of dates

data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# 3. Merge Data and Time in a new variable (column)

subdata$date.time <- strptime(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")

# 4. Plot in a png

plot(subdata$date.time, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()