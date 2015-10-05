# read data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

dat.graphs <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png("plot1.png", width = 480, height = 480, units = "px")
hist(dat.graphs$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
