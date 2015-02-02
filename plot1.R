xdata <- read.table('household_power_consumption.txt', 
                    sep=';', header=TRUE, as.is=TRUE, na.strings="?")

dates <- as.Date(xdata[,1], format="%d/%m/%Y")

xdata <- xdata[dates == "2007-02-01" | dates == "2007-02-02",]

png('plot1.png')

with(xdata, hist(Global_active_power, 15, col='red', 
                 xlab="Global Active Power (kilowatts)",
                 main="Global Active Power"))

dev.off()