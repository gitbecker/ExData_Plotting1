
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

#Data looks clean

#Combine date/time and change data type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime = as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Filter data for the subset we are interested in
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
                    
#Plot1 - Global Active Power
png("plot1.png", height=480, width=480)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency",
     main="Global Active Power", col="Red")

#Close the file connection
dev.off()


###################################################


