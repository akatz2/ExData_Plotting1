source("ex1_get_data.R")

# Plots a 2x2 grid of plots of:
#   top left     - global active power time series
#   bottom left  - plot2
#   top right    - voltage time series
#   bottom right - global reactive 
# the [Electric Power Consumption dataset](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
#
# Only includes  data from 2007-02-01 and 2007-02-02.

# Data takes a long time to load so I'm caching
if( !exists("ex_data_analysis_wk1_data") ) {
  ex_data_analysis_wk1_data <- getData()
} else {
  mydata <- ex_data_analysis_wk1_data
}

# plot the data
png( "plot4.png", width=480, height=480 )

par( mfcol=c(2,2) )

# plot 1,1
plot( mydata$DateTime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# plot 2,1
plot( mydata$DateTime, mydata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points( mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
points( mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)

# plot 1,2
plot( mydata$DateTime, mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 2,2
plot( mydata$DateTime, mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_Rective_power")


dev.off()
