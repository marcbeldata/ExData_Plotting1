# 1. Read data from working directory

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# 2. Convert Date to Date classes and select range of dates

data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# 3. Merge Data and Time in a new variable (column)

subdata$date.time <- strptime(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")

# 4. Plot the histogram in a png

hist(subdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()