

library(readr)
library(lubridate)

# Read data using readr function
df = read_csv2('.\\household_power_consumption.txt', col_names=T)

# Format dates and subset data from Feb. 1-2, 2017 
df$Date = as.Date(df$Date,format='%d/%m/%Y')
df2 = subset(df, Date == '2007-02-01' | Date == '2007-02-02')

# Create date-time variable with lubridate
df2$date_time = ymd_hms(paste(df2$Date, df2$Time))

# Create plot 3
png(file = "plot3.png")
with(df2, plot(date_time, Sub_metering_1, type = 'l',
               ylab = 'Energy sub metering', xlab = ''))
lines(df2$date_time, df2$Sub_metering_2, type = 'l', col = 'red')
lines(df2$date_time, df2$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = c(1,1,1), col = c('black', 'red', 'blue'))
dev.off()
