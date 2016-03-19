plot4 <- function() {

# Reads data and makes a histogram
# read data, first line contain headers, column separator , dcimal character and na character
volt<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",dec=".", na.strings="?")

#Read date format
volt$Date <- as.Date(volt$Date, format = "%d/%m/%Y")

#create a date time variable
volt$DateTime <- strptime(paste(volt$Date, volt$Time), format = "%Y-%m-%d %H:%M:%S")

# filter only two days
volt2days<-subset(volt, volt$Date>=as.Date("2007-02-01") & volt$Date<=as.Date("2007-02-02")  )

#open the file to write
png(filename="plot4.png", width=480, height=480)

#create 2X2 frame by col
par(mfcol = c(2, 2))

#create plot left top
plot(volt2days$DateTime,volt2days$Global_active_power,col="black",xlab="", ylab="Global Active Power",type="l")

#create plot left second
with(volt2days,plot(volt2days$DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering"))
with(volt2days,points(volt2days$DateTime,Sub_metering_2,type="l",col="red"))
with(volt2days,points(volt2days$DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,1,1), col=c("black","red","blue"))

#create plot right top
plot(volt2days$DateTime,volt2days$Voltage,type="l",xlab="datetime",ylab="Voltage")

#create plot right second
plot(volt2days$DateTime,volt2days$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

# writing to file
dev.off()
}