### to load file
setwd("C:/Users/user/Desktop/DataScience/Exploratory Analysis/P1/")
fileName <- "./household_power_consumption.txt"
hpc_file_data <- read.table(fileName, header=T, sep = ";", stringsAsFactors = F,na.strings="?", dec=".")

### checking number of obs. and variables 
str(hpc_file_data)

### to limit data to specifi dates 2007-02-01 and 2007-02-02
hpc_file_data_subset <- hpc_file_data[hpc_file_data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(hpc_file_data_subset)
rm(hpc_file_data)

### to change date format to %d/%m/%Y
hpc_file_data_subset$Date <- as.Date(hpc_file_data_subset$Date, format="%d/%m/%Y")
#str(hpc_file_data_subset)

### to join Date and Time and add to original object hpc_file_data_subset
date_and_time <- paste(as.Date(hpc_file_data_subset$Date), hpc_file_data_subset$Time)
hpc_file_data_subset$Date_and_time <- as.POSIXct(date_and_time)

### To change names of the days (x-axis) from Polish to English
Sys.setlocale("LC_TIME", "English") 

### Plot 2
with(hpc_file_data_subset ,plot(Global_active_power~Date_and_time, type="l",
                                ylab="Global Active Power (kilowatts)", xlab=""))

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png",height=480, width=480)

## Don't forget to close the PNG device!
dev.off() 