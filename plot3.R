originaldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F)
originaldata$Date <- as.Date(originaldata$Date, format="%d/%m/%Y")

data <- subset(originaldata, Date == "2007-02-01" | Date == "2007-02-02")

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow=c(1,1))

plot(data$Sub_metering_1~data$Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$Datetime, col='red')
lines(data$Sub_metering_3~data$Datetime, col='blue')
legend('topright',col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty = 1,lwd=2)


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()