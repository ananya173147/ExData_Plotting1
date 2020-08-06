
#reading data
data<- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?") 
#converting date column into date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#subset data with only required dates
data<- subset(data,subset = (Date>="2007-02-01"& Date<="2007-02-02"))
#convert date and times and make a new column
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#plot 2
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)