#Data
install.packages("dplyr")
library(dplyr)
if(!file.exists("exdata_data_household_power_consumption.zip")){
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,"rawData.zip",method = "curl")
}
if(!file.exists("household_power_consumption.txt")){
  unzip("rawData.zip")
}
colNames<-read.table("household_power_consumption.txt",nrows=1 ,sep = ";")
Rawdata<-read.table("household_power_consumption.txt",sep = ";",skip = 1, col.names = colNames,skipNul = TRUE )
Data<-filter(Rawdata,Rawdata$Date=="2/1/2007" | Rawdata$Date=="2/2/2007")

#graph1 frequency vs Global Active Power (kilowatts) 
plot1<-hist(as.numeric(as.character(Data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
