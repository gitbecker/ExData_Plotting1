
#######################################
#Coursera - Data Science Specialization
#Exploratory Data Analysis
#2016-08-15
#######################################

#Clear workspace
rm(list=ls())

#Load the data
data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", 
                   header = TRUE, stringsAsFactors=FALSE)

#Get a feel for the data
head(data)
summary(data)
str(data)

#Combine date/time and change data type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime = as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Filter data for the subset we are interested in
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Plot4
png("plot4.png", height=480, width=480)

par(mfrow = c(2,2))

with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab="Global Active Power"))
with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab="Voltage"))

with(data, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1, col = "black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black","red","blue"))

with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power"))

#Close the file connection
dev.off()

###################################################


