setwd("~/DataScience/Course 4 Exploratory Data Analysis/Week 1")

#read in data
library(data.table)
powerdata <- fread("household_power_consumption.txt",
              na.strings='?')

head(powerdata)
str(powerdata)

# convert date into date class
powerdata$DateTime <- as.POSIXct(paste(powerdata$Date,powerdata$Time), format = "%d/%m/%Y %H:%M:%S")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#filter for dates needed
powerdata <- powerdata[(Date>="2007-02-01") & (Date <= "2007-02-02")]


setwd("~/DataScience/ExData_Plotting1")

#4
png("plot4.png", width =480, height=480)

#global graphics parameter
par(mfcol = c(2,2))
#top left
with(powerdata, plot(x = DateTime, 
                     y= Global_active_power,
                     ylab = "Global Active Power (kilowatts)",
                     xlab="",
                     type="l"))
#bottom left
with(powerdata, plot(x = DateTime, 
                     y= Sub_metering_1,
                     ylab = "Energy Sub Metering",
                     xlab="",
                     type="l"))
with(powerdata, lines(DateTime, Sub_metering_2, col = "red"))
with(powerdata, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", 
       col=c("black","red", "blue"), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,
       lwd = 1)

#top right
with(powerdata, plot(x = DateTime, 
                     y= Voltage,
                     type="l"))

#bottom right
with(powerdata, plot(x = DateTime, 
                     y= Global_reactive_power,
                     type="l"))
dev.off()


