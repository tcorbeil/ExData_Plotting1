## Course Project 1. Sept. 2015

## Plot 3

## Read in data, subsetting for desired dates

require('data.table')

data1 <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), 
                    sep = ";",
                    col.names = c("Date", "Time", "Global_active_power",
                                  "Global_reactive_power", "Voltage",
                                  "Global_intensity", "Sub_metering_1",
                                  "Sub_metering_2",  "Sub_metering_3")
)
  ## The above line of code taken from the discussion "Reading data only for the
  ##   required dates" on the Coursera discussion forum. Line of code provided
  ##   by Chad Junkermeier. (Added the 'sep' and 'col.names' arguments.)

attach(data1)
DateTime <- paste(Date, Time)
DateTimeFormatted <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

png("plot3.png")
  plot(DateTimeFormatted, Sub_metering_1, type = "l",
       xlab = " ", ylab = "Energy sub metering")
  lines(DateTimeFormatted, Sub_metering_2, col = "red")
  lines(DateTimeFormatted, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"),
                           legend = c("Sub_metering_1", "Sub_metering_2",
                                    "Sub_metering_3"))
dev.off()