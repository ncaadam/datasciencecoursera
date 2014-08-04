#loading the whole data file
raw_data <- read.table("household_power_consumption.txt",sep = ";",header = T)

#changing the date column to a Date format in R and combining time
raw_data$Datetime <- as.POSIXct(paste(raw_data$Date, raw_data$Time), format="%d/%m/%Y %H:%M:%S")

#subsetting the data to look at the month of February in 2007
subset_data <- subset(raw_data,subset = Datetime >= as.POSIXct("2007/02/01 00:00:00") & Datetime < as.POSIXct("2007/02/03 00:00:00"))

#converting the Global Active Power column to a numeric class
subset_data$Global_active_power <- as.numeric(as.character.factor(subset_data$Global_active_power))

#creating a png device
png(file = "plot2.png")

#creating the plot
plot(subset_data$Datetime,subset_data$Global_active_power,type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")

#closing the connection
dev.off()