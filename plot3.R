#Exploratory_Data_Analysis - exdata-035
# Course project 1
# plot3.R

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

# start plotting Sub mettering energy data  vs DateTime
par(mfrow=c(1,1), mar = c(3,4,2,2))
with(interest_household_power_data, plot(DateTime,Sub_metering_1, ylab = "Energy Sub Metering", type = "n"))
lines(interest_household_power_data$DateTime,interest_household_power_data$Sub_metering_1, col = "black")
lines(interest_household_power_data$DateTime,interest_household_power_data$Sub_metering_2, col = "red")
lines(interest_household_power_data$DateTime,interest_household_power_data$Sub_metering_3, col = "blue")
#Add legend:
legend("topright", lty = 1, col = c("black","red","blue"), 
                 legend = names(interest_household_power_data)[7:9], 
                 lwd = 1.3, cex = .7, adj = .08)

# Copy to png file with size 480 x 480
dev.copy(png, file = "plot3.png",width = 480, height = 480, units = "px")  
dev.off()