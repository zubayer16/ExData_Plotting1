#Reading the text file in a table
powercon<-read.table("household_power_consumption.txt",header=TRUE,sep = ";")

#Extracting data for rows with dates 1/2/2007 and 2/2/2007
powercon1<-subset(powercon,Date=="1/2/2007" | Date=="2/2/2007",select=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_1","Sub_metering_2","Sub_metering_3"))



#tail(powercon1)

#For plotting the histogram on Screen 
hist(as.numeric(as.character(powercon1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)")

#Copying the plot in a png file with 480*480 dimension by default
dev.copy(png,file="plot1.png")
dev.off()
