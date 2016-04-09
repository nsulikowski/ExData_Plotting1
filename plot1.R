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
data <-   
  mutate(data, Date = dmy(Date) ) %>%
  filter(Date>=ymd("2007-02-01") & Date <= ymd("2007-02-02"))

png("plot1.png",width=480,height=480,units="px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()