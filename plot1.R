## make plot 1
# set working directory
setwd('~/Documents/exploratory_data_analysis_course_project_1/')

# read in files
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset data
data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## convert dates
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

## make plot and save to file
hist(data2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()
