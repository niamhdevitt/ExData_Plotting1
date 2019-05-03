setwd("~/DataScience/Course 4 Exploratory Data Analysis/Week 1")

#read in data
library(data.table)
powerdata <- fread("household_power_consumption.txt",
              na.strings='?')

head(powerdata)
str(powerdata)

# convert date into date class
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#filter for dates needed
powerdata <- powerdata[(Date>="2007-02-01") & (Date <= "2007-02-02")]


setwd("~/DataScience/ExData_Plotting1")

#1
png("plot1.png", width =480, height=480)
hist(powerdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
