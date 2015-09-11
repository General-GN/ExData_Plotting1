## Filter and format required data

data <- read.table(file = "household_power_consumption.txt", sep = ";", as.is = TRUE, na.strings = c("?"), header = TRUE)
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
filtered_data <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plot the histogram 

png(file = "plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
