fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "dataset.zip")
unzip("dataset.zip")
dataset <- read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep = ";")
interest_data <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
datetime <- as.POSIXct(strptime(paste(interest_data$Date,interest_data$Time), "%d/%m/%Y %H:%M:%S"))
with(interest_data,plot(Global_active_power~datetime, xlab="",
                        ylab="Global Active Power (kilowatts)",type="l"))

with(interest_data,{plot(Sub_metering_1~datetime, xlab="",
                         ylab="Energy sub metering",type="l",col="black")
    lines(Sub_metering_2~datetime,col="red")
    lines(Sub_metering_3~datetime,col="blue")})
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(interest_data,plot(Voltage~datetime, xlab="datetime",
                        ylab="Voltage",type="l"))

with(interest_data,plot(Global_reactive_power~datetime, xlab="datetime",
                        ylab="Global_reactive_power",type="l"))
dev.off()