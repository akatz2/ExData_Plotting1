source("ex1_get_data.R")

# Plots a time series of global active data
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
png( "plot2.png", width=480, height=480 )
plot( mydata$DateTime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
