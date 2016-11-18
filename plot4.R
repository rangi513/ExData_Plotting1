library(tidyverse)
## Read in and transform the data
power_ <- read_csv2(file = "household_power_consumption.txt") %>% 
        mutate(Date = lubridate::dmy(Date)) %>% 
        filter(Date == lubridate::ymd("2007-02-01") | Date == lubridate::ymd("2007-02-02"))

power_$datetime <- as.POSIXlt(paste(power_$Date,power1$Time))

par(mfrow = c(2,2))

# Plot 1 
plot(power_$datetime, power_$Global_active_power, 
     type = "l", xlab = "", 
     ylab = "Global Active Power")

# Plot 2 
plot(power_$datetime, power_$Voltage/1000, xlab = "datetime", ylab = "Voltage", type = "l")

# Plot 3
plot(power_$datetime, power_$Sub_metering_1, type = "l", 
        col = "black", ylab = "Energy sub metering", xlab = "")
        lines(power_$datetime,power_$Sub_metering_2, col = "red")
        lines(power_$datetime,power_$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                col = c("black","red","blue"), lty = c(1,1), bty="n", cex=.5)
        
# Plot 4 
plot(power_$datetime, power_$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")        


## Save as PNG
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()