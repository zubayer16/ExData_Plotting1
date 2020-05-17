#Reading the text file in a table
powercon<-read.table("household_power_consumption.txt",header=TRUE,sep = ";")

#Extracting data for rows with dates 1/2/2007 and 2/2/2007
powercon1<-subset(powercon,Date=="1/2/2007" | Date=="2/2/2007",select=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Converting the dates to a standard format and storing it
df<-strptime(paste(powercon1$Date, powercon1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#head(df)

#Making room for four graphs in a single screen
par(mfrow=c(2,2))

#Creating the first graph
activepower<-as.numeric(as.character(powercon1$Global_active_power))
plot(df,activepower,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#The secong Graph
voltage<-as.numeric(as.character(powercon1$Voltage))
plot(df,voltage,type="l", xlab="", ylab="Voltage")

#The third Graph
metering<-as.numeric(as.character(powercon1$Sub_metering_1))
metering1<-as.numeric(as.character(powercon1$Sub_metering_2))
metering2<-as.numeric(as.character(powercon1$Sub_metering_3))
plot(df,metering,type="l", xlab="", ylab="Energy Sub metering")
lines(df,metering1,col="red")
lines(df,metering2,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.6,col=c("black","red","blue"))

#The fourth graph
reactivepower<-as.numeric(as.character(powercon1$Global_reactive_power))
plot(df,reactivepower,type="l", xlab="", ylab="Global_reactive_power")

#Copying the plot in a png file with 480*480 dimension by default
dev.copy(png,file="plot4.png")
dev.off()