data <-read.table('household_power_consumption.txt',sep=';',header=TRUE)
# Read the whole dataset into pc_data. 
# Keep only the following two dates, "1/2/2007" and "2/2/2007".
# Convert the Date column to IDate class and Time column to ITime class.
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(as.character(data$DateTime),format = '%d/%m/%Y %H:%M:%S') 
data$Date  = as.Date(strptime(as.character(data$Date),format = '%d/%m/%Y'))
# Applying Filters for specific Dates
data.filtered <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
data.filtered$Global_active_power <- as.numeric(as.character(data.filtered$Global_active_power))

# Plot histogram of variable "Global_active_power" and save to a png file.

png(file='plot1.png')
hist(data.filtered$Global_active_power,ylim=c(0,1200), breaks = "sturges",xlab='Global Active Power (kilowatts)',main='Global Active Power',col="red")
dev.off()
