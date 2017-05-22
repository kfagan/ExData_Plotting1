
library(readr)
library(lubridate)

# Read data using readr function
df = read_csv2('.\\household_power_consumption.txt', col_names=T)

# Format dates and subset data from Feb. 1-2, 2017 
df$Date = as.Date(df$Date,format='%d/%m/%Y')
df2 = subset(df, Date == '2007-02-01' | Date == '2007-02-02')

# Create date-time variable with lubridate
df2$date_time = ymd_hms(paste(df2$Date, df2$Time))

# Create plot 2
png(file = "plot2.png")
with(df2, plot(date_time, Global_active_power, type = 'l',
               ylab = 'Global Active Power (kilowatts)', xlab = ''))
dev.off()
