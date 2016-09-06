originaldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F)
originaldata$Date <- as.Date(originaldata$Date, format="%d/%m/%Y")

data <- subset(originaldata, Date == "2007-02-01" | Date == "2007-02-02")

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow=c(1,1))

plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()