# read data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$timestamp <- as.POSIXlt(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S", tz = Sys.timezone())
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

dat.graphs <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# switch locale to make weekday labels appear in English and not in my local language
Sys.setlocale("LC_TIME", "C")

png("plot2.png", width = 480, height = 480, units = "px")
plot(dat.graphs$timestamp, dat.graphs$Global_active_power, type="l", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
