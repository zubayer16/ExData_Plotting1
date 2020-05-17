#Reading the text file in a table
powercon<-read.table("household_power_consumption.txt",header=TRUE,sep = ";")

#Extracting data for rows with dates 1/2/2007 and 2/2/2007
powercon1<-subset(powercon,Date=="1/2/2007" | Date=="2/2/2007",select=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Converting the dates to a standard format and storing it
df<-strptime(paste(powercon1$Date, powercon1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#head(df)

#Storing all the three different columns
metering<-as.numeric(as.character(powercon1$Sub_metering_1))
metering1<-as.numeric(as.character(powercon1$Sub_metering_2))
metering2<-as.numeric(as.character(powercon1$Sub_metering_3))

#Plotting the first column from the data frame
plot(df,metering,type="l", xlab="", ylab="Energy Sub metering")

#Appending two more lines in the previous plot
lines(df,metering1,col="red")
lines(df,metering2,col="blue")

#Labelling on the top right corner of the graph for better understanding
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"))

#Copying the plot in a png file with 480*480 dimension by default
dev.copy(png,file="plot3.png")
dev.off()