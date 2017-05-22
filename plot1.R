

library(readr)

# Read data using readr function
df = read_csv2('.\\household_power_consumption.txt', col_names=T)

# Format dates and subset data from Feb. 1-2, 2017 
df$Date = as.Date(df$Date,format='%d/%m/%Y')
df2 = subset(df, Date == '2007-02-01' | Date == '2007-02-02')

# Make X axis variable numeric
df2$Global_active_power = as.numeric(df2$Global_active_power)

# Create plot 1
png(file = "plot1.png")
hist(df2$Global_active_power, col='red', 
    main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()