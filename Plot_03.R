#optional area'
#setwd("/Users/i312190/Desktop/Data Science/UNIT4/WEEK1")
#optional area'
raw_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
raw_data$Time <- paste(raw_data$Date, raw_data$Time)
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")
new_data <- raw_data[raw_data$Date >= "2007-02-01" & raw_data$Date <= "2007-02-02" , ]
new_data$Time <- as.POSIXct(new_data$Time, format = "%d/%m/%Y %H:%M:%S")
plot(new_data$Time, new_data$Sub_metering_1, type = "l", xlab = "", col = "black", ylab = "Energy sub metering")

lines(new_data$Time, new_data$Sub_metering_2, type = "l", xlab = "", col = "red")
lines(new_data$Time, new_data$Sub_metering_3, type = "l", xlab = "", col = "blue")
legend(legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), x = "topright", y = "top", lty=1:1, cex = 0.8 )
dev.copy(png,'Plot3.png', width=480, height=480)
dev.off()
