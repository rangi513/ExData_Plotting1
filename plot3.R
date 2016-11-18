library(tidyverse)
## Read in and transform the data
power_ <- read_csv2(file = "household_power_consumption.txt") %>% 
        mutate(Date = lubridate::dmy(Date)) %>% 
        filter(Date == lubridate::ymd("2007-02-01") | Date == lubridate::ymd("2007-02-02"))

power_$datetime <- as.POSIXlt(paste(power_$Date,power1$Time))

par(mfrow = c(1,1))
## Plot 3
plot(power_$datetime, power_$Sub_metering_1, type = "l", 
        col = "black", ylab = "Energy sub metering", xlab = "")
        lines(power_$datetime,power_$Sub_metering_2, col = "red")
        lines(power_$datetime,power_$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col = c("black","red","blue"), lty = c(1,1))
       
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()