#Exploratory_Data_Analysis - exdata-035
# Course project 1
# plot1.R

#Instruction: put the data file in the working directory in order to run the code

library(sqldf)
#Read the data into dataframe, filtering value only in 2 days 1st & 2nd of Jul 2007
interest_household_power_data <- read.csv.sql("household_power_consumption.txt", 
        sql = "select * from file WHERE Date IN ('1/2/2007','2/2/2007')", 
        header = TRUE, sep = ";")

#Start plotting
par(mfrow=c(1,1)) #1 row, 1 column only
par(mar= c(4,4,3,2)) # set margin

#draw histogram
hist(interest_household_power_data$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# Copy to png file with size 480 x 480
dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px")  
dev.off()
