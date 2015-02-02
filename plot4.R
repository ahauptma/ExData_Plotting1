xdata <- read.table('household_power_consumption.txt', 
                    sep=';', header=TRUE, as.is=TRUE, na.strings="?")

dates <- as.Date(xdata[,1], format="%d/%m/%Y")

xdata <- xdata[dates == "2007-02-01" | dates == "2007-02-02",]

xdata$datetime <- as.POSIXct(paste(xdata[,1], xdata[,2]), 
                             format="%d/%m/%Y %H:%M:%S")

png('plot4.png')

par(mfrow=c(2, 2))

with(xdata, plot(datetime, Global_active_power, type='l',
                 xlab="", ylab="Global Active Power"))
with(xdata, plot(datetime, Voltage, type='l'))
with(xdata, plot(datetime, Sub_metering_1, type='l',
                 xlab="",
                 ylab="Energy sub metering"))
with(xdata, lines(datetime, Sub_metering_2, type='l', col='red'))
with(xdata, lines(datetime, Sub_metering_3, type='l', col='blue'))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1), bty='n',
       col=c("black", "red", "blue"))
with(xdata, plot(datetime, Global_reactive_power, type='l'))

dev.off()