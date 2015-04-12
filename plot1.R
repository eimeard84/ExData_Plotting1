plot1 <- function(infile="household_power_consumption.txt") {
  # Takes the argument infile and plots a four-panel figure

#  install.packages("data.table")
#  library(data.table)
  
  dt<-read.table("household_power_consumption.txt",
      skip=66637,nrows=2880,na.strings="?",sep=";")
  # Read data from 01.02.2007 to 02.02.2007 only
  
  heads<-read.csv("household_power_consumption.txt",
                  nrows=1,na.strings="?",sep=";")
  # Read column names from text file
  
  setnames(dt,names(heads))
  # Use column names from text file for data table
  
  png(filename="plot1.png",width=480,height=480,units="px",
      bg="white")
  # Open a .png device
  
  hist(dt$Global_active_power,col="red",
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power")
  # Make a histogram of global active power
  
  dev.off()

}