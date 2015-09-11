## Filter and format required data

data <- read.table(file = "household_power_consumption.txt", sep = ";", as.is = TRUE, na.strings = c("?"), header = TRUE)
data$DateTime <- do.call(paste, c(data[c("Date", "Time")], sep = " "))
data$DateTimeValue <- strptime(data[,"DateTime"], "%d/%m/%Y %H:%M:%S")
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
filtered_data <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plot the graph

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(filtered_data$DateTimeValue, filtered_data$Global_active_power, type = "l", xlab =  "", ylab = "Global Active Power (kilowatts)")
plot(filtered_data$DateTimeValue, filtered_data$Voltage, type = "l", col = "black", xlab =  "datetime", ylab = "Voltage")
plot(filtered_data$DateTimeValue, filtered_data$Sub_metering_1, type = "l", col = "black", xlab =  "", ylab = "Energy sub metering")
points(filtered_data$DateTimeValue, filtered_data$Sub_metering_2, type = "l", col = "red")
points(filtered_data$DateTimeValue, filtered_data$Sub_metering_3, type = "l", col = "blue")
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , lty=1, col=c('black', 'red', 'blue'), bty='n')
plot(filtered_data$DateTimeValue, filtered_data$Global_reactive_power, type = "l", col = "black", xlab =  "datetime", ylab = "Global_reactive_power")
dev.off()

