#Exploratory_Data_Analysis - exdata-035
# Course project 1
# plot2.R

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

par(mar = c(3,4,3,2))
# start plotting GLobal Active Power data  vs DateTime
with(interest_household_power_data, 
     plot(DateTime,Global_active_power, type="n", ylab = "Global Active Power (kilowatts)")) # Generate frame first


lines(interest_household_power_data$DateTime,interest_household_power_data$Global_active_power) #actual plot the line

# Copy to png file with size 480 x 480
dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px")  
dev.off()