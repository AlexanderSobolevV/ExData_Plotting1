setwd("/Users/i312190/Desktop/Data Science/UNIT4/WEEK1")
raw_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
raw_data$Time <- paste(raw_data$Date, raw_data$Time)
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")
new_data <- raw_data[raw_data$Date >= "2007-02-01" & raw_data$Date <= "2007-02-02" , ]
new_data$Time <- as.POSIXct(new_data$Time, format = "%d/%m/%Y %H:%M:%S")
plot(new_data$Time, new_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png,'Plot2.png', width=480, height=480)
dev.off()
