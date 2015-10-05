# read data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$timestamp <- as.POSIXlt(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S", tz = Sys.timezone())
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

dat.graphs <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# switch locale to make weekday labels appear in English and not in my local language
Sys.setlocale("LC_TIME", "C")

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
# plo1 1: Global Active Power
plot(dat.graphs$timestamp, dat.graphs$Global_active_power, type="l", 
     xlab="", ylab = "Global Active Power")
# plot 2: VOltage
plot(dat.graphs$timestamp, dat.graphs$Voltage, type="l", 
     xlab="datetime", ylab = "Voltage")
# plot 3: Energy sub metering
plot(dat.graphs$timestamp, dat.graphs$Sub_metering_1, type="l", #col = "darkgray",
     xlab="", ylab = "Energy sub metering")
lines(dat.graphs$timestamp, dat.graphs$Sub_metering_2, col = "red")
lines(dat.graphs$timestamp, dat.graphs$Sub_metering_3, col = "blue")
legend("topright", names(dat.graphs[7:9]), lty = c(1,1), col = c("black", "red", "blue"), bty = "n")
# plot 4: Global reactive power
plot(dat.graphs$timestamp, dat.graphs$Global_reactive_power, type="l", 
     xlab="datetime", ylab = colnames(dat.graphs)[4])
dev.off()
