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
  
str(data1)

png("plot3.png",width=480,height=480,units="px")

plot(data1$DateTime, data1$Sub_metering_1, lty="solid", 
     type="l", xlab="", ylab = "Energy sub metering",
     mar=c(0, 2, 0, 2))
lines(data1$DateTime, data1$Sub_metering_2, col="red")
lines(data1$DateTime, data1$Sub_metering_3, col="blue")
legend("topright",
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1,1),
       col=c('black','red','blue'))
dev.off()
