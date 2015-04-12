plot4 <- function(infile="household_power_consumption.txt") {
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
  
  dt$DateTime <- with(dt,paste(Date,Time),sep=" ")
  dt$DateTime <- strptime(dt$DateTime,"%d/%m/%Y %H:%M:%S")
  # Add a column which combines the data and time attributes
    
  png(filename="plot4.png",width=480,height=480,units="px",
      bg="white")
  # Open a .png device
  
  par(mfrow=c(2,2))
  # Four panels in the figure, filled row-wise
  
  #The requested panels are plotted below
  
  plot(dt$DateTime,dt$Global_active_power,
       type="l",main="",xlab="",
       ylab="Global Active Power")
  
  plot(dt$DateTime,dt$Voltage,
       type="l",main="",xlab="datetime",
       ylab="Voltage")
  
  
  plot(dt$DateTime,dt$Sub_metering_1,
       type="n",main="",xlab="",
       ylab="Energy sub metering")
  
  lines(dt$DateTime,dt$Sub_metering_1,
        col="black")
  
  lines(dt$DateTime,dt$Sub_metering_2,
        col="red")
  
  lines(dt$DateTime,dt$Sub_metering_3,
        col="blue")
  
  legend(x="topright",legend=c("Sub_metering_1",
        "Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=1)
  
  plot(dt$DateTime,dt$Global_reactive_power,
       type="l",main="",xlab="datetime",
       ylab="Global_reactive_power")
  
  dev.off()

}