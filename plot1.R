# plot1.R

# import data files into data frame 
data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.string = "?",colClasses = c(rep("character",2),rep("numeric",7)))

# extract the desired date range
sampledays <- subset(data, as.Date(data$Date,format = "%d/%m/%Y") >= "2007-02-01" & as.Date(data$Date,format = "%d/%m/%Y") <= "2007-02-02")

# plot histogram of Global Active Power
par(mar = c(5,4,1,1), cex = 0.6)
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
with(sampledays, hist(Global_active_power, main="Global Active Power", xlab ="Global Active Power (kilowatts)", col="red"))
dev.off()
