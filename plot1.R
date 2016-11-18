library(tidyverse)
## Read in and transform the data
power_ <- read_csv2(file = "household_power_consumption.txt") %>% 
        mutate(Date = lubridate::dmy(Date)) %>% 
        filter(Date == lubridate::ymd("2007-02-01") | Date == lubridate::ymd("2007-02-02"))

par(mfrow = c(1,1))

## Plot 1
        hist(as.numeric(power_$Global_active_power),
             col="red", 
             main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)")
        
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
                

