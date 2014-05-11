data <-read.table('household_power_consumption.txt',sep=';',header=TRUE)
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(as.character(data$DateTime),format = '%d/%m/%Y %H:%M:%S') 
data$Date  = as.Date(strptime(as.character(data$Date),format = '%d/%m/%Y'))
data.filtered <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
data.filtered$Global_active_power <- as.numeric(as.character(data.filtered$Global_active_power))

Sys.setlocale(locale = "C")
#2
png(file='plot2.png')
plot(data.filtered$DateTime,data.filtered$Global_active_power,type="l",ylab='Global Active Power (kilowatts)',xlab='')
dev.off()
