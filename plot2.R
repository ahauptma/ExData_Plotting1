xdata <- read.table('household_power_consumption.txt', 
                    sep=';', header=TRUE, as.is=TRUE, na.strings="?")

dates <- as.Date(xdata[,1], format="%d/%m/%Y")

xdata <- xdata[dates == "2007-02-01" | dates == "2007-02-02",]

xdata$datetime <- as.POSIXct(paste(xdata[,1], xdata[,2]), 
                             format="%d/%m/%Y %H:%M:%S")

png('plot2.png')

with(xdata, plot(datetime, Global_active_power, type='l',
                 xlab="",
                 ylab="Global Active Power (kilowatts)"))

dev.off()