## Filter and format required data

data <- read.table(file = "household_power_consumption.txt", sep = ";", as.is = TRUE, na.strings = c("?"), header = TRUE)
data$DateTime <- do.call(paste, c(data[c("Date", "Time")], sep = " "))
data$DateTimeValue <- strptime(data[,"DateTime"], "%d/%m/%Y %H:%M:%S")
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
filtered_data <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plot the graph

png(file = "plot2.png", width = 480, height = 480)
plot(filtered_data$DateTimeValue, filtered_data$Global_active_power, type = "l", xlab =  "", ylab = "Global Active Power (kilowatts)")
dev.off()