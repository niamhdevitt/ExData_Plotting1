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

#2
png("plot2.png", width =480, height=480)
with(powerdata, plot(x = DateTime, 
                     y= Global_active_power,
                     ylab = "Global Active Power (kilowatts)",
                     xlab="",
                     type="l"))
dev.off()

