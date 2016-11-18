library(tidyverse)
## Read in and transform the data
power_ <- read_csv2(file = "household_power_consumption.txt") %>% 
        mutate(Date = lubridate::dmy(Date)) %>% 
        filter(Date == lubridate::ymd("2007-02-01") | Date == lubridate::ymd("2007-02-02"))

power_$datetime <- as.POSIXlt(paste(power_$Date,power1$Time))


par(mfrow = c(1,1))
## Plotting line graph function
plot(power_$datetime, power_$Global_active_power, 
     type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
                
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
