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
  filter( DateTime>=as.POSIXct("2007-02-01", tz="GMT") & Date1 < as.POSIXct("2007-02-03", tz="GMT") )
  
  

str(data1)

#png("plot1.png",width=480,height=480,units="px")
with(data1, plot(Date1, Global_active_power) )

axis.Date(1, at = seq(d[1], d[100], length.out=25),
          labels = seq(d[1], d[100], length.out=25),
          format= "%m/%d/%Y", las = 2)
#dev.off()  col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"