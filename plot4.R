#Exploratory_Data_Analysis - exdata-035
# Course project 1
# plot4.R

#Instruction: put the data file in the working directory in order to run the code

library(sqldf)
#Read the data into dataframe, filtering value only in 2 days 1st & 2nd of Jul 2007
interest_household_power_data <- read.csv.sql("household_power_consumption.txt", 
                                              sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", 
                                              header = TRUE, sep = ";")
# Create a new column called DateTime to store both date & time values
interest_household_power_data$DateTime <- as.POSIXct(paste(interest_household_power_data$Date, 
                                                           interest_household_power_data$Time), 
                                                     format="%d/%m/%Y %H:%M:%S")

# Start plotting:
#Initiate png file to be plot into
png(file = "plot4.png",width = 480, height = 480, units = "px") 
# Initial setup: 4 plots on 2 rows & 2 columns; smaller font size
par(mfrow=c(2,2), cex = 0.8, mar = c(4,5,2,1))
# 1st graph - Global_active_power vs DateTime
with(interest_household_power_data, 
        plot(DateTime,Global_active_power, type="n", 
        ylab = "Global Active Power",
        xlab = "")) # Generate frame first

lines(interest_household_power_data$DateTime,
      interest_household_power_data$Global_active_power) #actual plot the line

# 2nd graph - Voltage vs Date time
with(interest_household_power_data, 
     plot(DateTime,Voltage, type="n", 
          ylab = "Voltage")) # Generate frame first

lines(interest_household_power_data$DateTime,
      interest_household_power_data$Voltage) #actual plot the line

#3rd graph - Energy Sub metering vs Date time
with(interest_household_power_data, 
     plot(DateTime,Sub_metering_1, 
          ylab = "Energy Sub Metering", type = "n",
          xlab = ""))
lines(interest_household_power_data$DateTime,interest_household_power_data$Sub_metering_1, col = "black")
lines(interest_household_power_data$DateTime,interest_household_power_data$Sub_metering_2, col = "red")
lines(interest_household_power_data$DateTime,interest_household_power_data$Sub_metering_3, col = "blue")
#Add legend:
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = names(interest_household_power_data)[7:9], 
       lwd = 1.3, bty = "n")

# 4th graph - Global Reactive Power vs DateTime
with(interest_household_power_data, 
     plot(DateTime,Global_reactive_power, type="n")) # Generate frame first

lines(interest_household_power_data$DateTime,
      interest_household_power_data$Global_reactive_power) #actual plot the line

# Do not use copy method, plot directly to png file with "png" function at the beginning
## Copy to png file with size 480 x 480
##dev.copy(png, file = "plot4.png",width = 480, height = 480, units = "px")  
dev.off()