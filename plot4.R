# plot4.R

# import data files into data frame 
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.string = "?",colClasses = c(rep("character",2),rep("numeric",7)))

# extract the desired date range
sampledays <- subset(data, as.Date(data$Date,format = "%d/%m/%Y") >= "2007-02-01" & as.Date(data$Date,format = "%d/%m/%Y") <= "2007-02-02")

date_and_time <- strptime(paste(sampledays$Date,sampledays$Time), format = "%d/%m/%Y %H:%M:%S")

# make plots

png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2,2), oma = c(1,1,1,1), mar = c(5,4,1,1), cex = 0.8)

# upper left
# Global Active Power by date and time

with(sampledays,plot(date_and_time,Global_active_power, type = "l", xlab ="", ylab = "Global Active Power"))

# upper right
# Voltage by date and time

with(sampledays,plot(date_and_time,Voltage, type = "l", xlab ="datetime", ylab = "Voltage"))

# lower left
# Sub metering by date and time

with(sampledays,plot(date_and_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(sampledays,points(date_and_time, Sub_metering_2, type = "l", col = "red"))
with(sampledays,points(date_and_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.8)

# lower right
# Global reactive power by date and time

with(sampledays,plot(date_and_time,Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power"))


dev.off()