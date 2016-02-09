# function to read the data from the datafile and return the data from 2/1 - 2/2/2007
# adds a DateTime column that stores the full time field
getData <- function( datafile='./household_power_consumption.txt' ) {
  
  # download the file if it does not exist from
  # [Electric Power Consumption dataset](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
  if (!file.exists('household_power_consumption.txt')) {
    
    # download the zip file and unzip
    URL <-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(URL,destfile='./household_power_consumption.zip')
    unzip('./household_power_consumption.zip',overwrite=TRUE)
    
  }

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