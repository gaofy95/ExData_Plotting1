fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "dataset.zip")
unzip("dataset.zip")
dataset <- read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep = ";")
interest_data <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
png("plot1.png", width=480, height=480)
par(mfrow=c(1,1))
with(interest_data,hist(Global_active_power,col="red",breaks=12,
                        xlab="Global Active Power (kilowatts)",
                        ylab="Frequency", main="Global Active Power"))
dev.off()
