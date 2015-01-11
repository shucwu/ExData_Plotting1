# plot2.R

# import data files into data frame 
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.string = "?",colClasses = c(rep("character",2),rep("numeric",7)))

# extract the desired date range
sampledays <- subset(data, as.Date(data$Date,format = "%d/%m/%Y") >= "2007-02-01" & as.Date(data$Date,format = "%d/%m/%Y") <= "2007-02-02")

date_and_time <- strptime(paste(sampledays$Date,sampledays$Time), format = "%d/%m/%Y %H:%M:%S")

# plot Global Active Power by date/time
par(mar = c(5,4,1,1), cex = 0.6)
png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
with(sampledays,plot(date_and_time,Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)"))
dev.off()