library(dplyr)
library(readr)
library(lubridate)

data <- read_delim(
  file="C:/Users/Nestor/Documents/Coursera/CourseProject1/household_power_consumption.txt", 
  col_names = TRUE,
  col_types = "ccnnnnnnn",
  na = c("?"),
  delim=";"
)
data1 <-   
  mutate(data, DateTime=as.POSIXct(strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")) ) %>%
  filter( DateTime>=as.POSIXct("2007-02-01", tz="GMT") & DateTime < as.POSIXct("2007-02-03", tz="GMT") )
  
png("plot4.png")

par( mfrow=c(2,2), mar=c(5, 4, 1, 1) )
plot(data1$DateTime, data1$Global_active_power, lty="solid", type="l", xlab="", ylab = "Global Active Power (kilowatts)")
plot(data1$DateTime, data1$Voltage, lty="solid", type="l", xlab="datetime", ylab = "Voltage")

plot(data1$DateTime, data1$Sub_metering_1, lty="solid", 
     type="l", xlab="", ylab = "Energy sub metering")
lines(data1$DateTime, data1$Sub_metering_2, col="red")
lines(data1$DateTime, data1$Sub_metering_3, col="blue")
legend("topright",
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1,1),
       col=c('black','red','blue'))

with(data1, plot(DateTime, Global_reactive_power, lty="solid", type="l", xlab="datetime"))

dev.off()
