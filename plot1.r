## Read complete dataset into R
completedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
completedata$Date <- as.Date(completedata$Date, format="%d/%m/%Y")

## Take a subet of the data
data <- subset(completedata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(completedata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()