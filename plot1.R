# Plots the frequency of Global Acive Power in kilowatts for 2007-02-01 and 
#   2007-02-02

# Reads in the Household Power Consumption data from the text file
epc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses
    =c("character","character","double","double","double","double","double",
    "double","numeric"),na.strings="?")

# Formats the date and time columns to be a single date/time class column
epc$DateTime = paste(epc$Date, epc$Time)
epc$DateTime = as.POSIXlt(epc$DateTime,format="%d/%m/%Y %H:%M:%S")
epc$Date = NULL
epc$Time = NULL

# Gets the relevant data needed for analysis (2007-02-01 and 2007-02-02)
subepc <- subset(epc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | 
    DateTime$mday==2))

# Creates a histogram of Global Active Power frequencies in png file
png("plot1.png")
hist(subepc$Global_active_power,main="Global Active Power",ylab="Frequency",
    xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))

dev.off()