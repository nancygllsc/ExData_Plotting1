#plot4
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
DateTime=with(Data,paste(Date,Time))
Plot2Data=mutate(Data,DateTime)
#plot4 
par(mfrow = c(2 , 2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) #row,graphs
with(Plot2Data,{
  plot(strptime(DateTime,"%m/%d/%Y %H:%M:%S"),Global_active_power,type="l",xlab = "",ylab = "Global Active Power")
  plot(strptime(DateTime,"%m/%d/%Y %H:%M:%S"),Voltage,type="l",xlab = "daytie",ylab = "Voltage")
  plot(strptime(DateTime,"%m/%d/%Y %H:%M:%S"),Sub_metering_3,type="l",xlab = "", ylab = "Energy Sub metering",col= "blue")
  lines(strptime(DateTime,"%m/%d/%Y %H:%M:%S"),Sub_metering_2,type="l",xlab = "", ylab = "Global Active Power (kilowatts)",col= "red")
  lines(strptime(DateTime,"%m/%d/%Y %H:%M:%S"),Sub_metering_1,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(strptime(DateTime,"%m/%d/%Y %H:%M:%S"),Global_reactive_power,type="l", xlab = "datetime",ylab = "Global Reactive Power")
})
dev.copy(png, file = "plot4.png")
dev.off()
