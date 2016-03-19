plot1 <- function() {

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
png(filename="plot1.png", width=480, height=480)

#create histogram
hist(volt2days$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# end writing to file
dev.off()

}