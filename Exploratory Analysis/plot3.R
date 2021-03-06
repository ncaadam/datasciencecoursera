#loading the whole data file
raw_data <- read.table("household_power_consumption.txt",sep = ";",header = T)

#changing the date column to a Date format in R and combining time
raw_data$Datetime <- as.POSIXct(paste(raw_data$Date, raw_data$Time), format="%d/%m/%Y %H:%M:%S")

#subsetting the data to look at the month of February in 2007
subset_data <- subset(raw_data,subset = Datetime >= as.POSIXct("2007/02/01 00:00:00") & Datetime < as.POSIXct("2007/02/03 00:00:00"))

#converting the data to a numeric class
subset_data$Sub_metering_1 <- as.numeric(as.character.factor(subset_data$Sub_metering_1))
subset_data$Sub_metering_2 <- as.numeric(as.character.factor(subset_data$Sub_metering_2))

#creating a png device
png(file = "plot3.png")

#creating the plot
plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "n", xlab = "",ylab = "Energy sub metering")
points(subset_data$Datetime,subset_data$Sub_metering_1,type = 'l')
points(subset_data$Datetime,subset_data$Sub_metering_2,type = 'l', col = "red")
points(subset_data$Datetime,subset_data$Sub_metering_3,type = 'l', col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#closing the connection
dev.off()