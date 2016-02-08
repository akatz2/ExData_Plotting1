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


# function to read the data from the datafile and return the data from 2/1 - 2/2/2007
# adds a DateTime column that stores the full time field
getData <- function( datafile='./household_power_consumption.txt' ) {
  
  # reads in the data file and ensures that columns are not all converted to factors (as.is=TRUE)
  df <- read.table(datafile, header=TRUE, sep=";", na.strings = c("?"), 
                   colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  # add a time column for granularity
  df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
  
  # fist column is a date
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  
  # filter by dates
  date_lb = as.Date("2007-2-1")
  date_ub = as.Date("2007-2-2")
  
  mydata <- df[ (df$Date >= date_lb & df$Date <= date_ub), ]
  
  return(mydata)
}