EPC <- read.table("C:/Amit/DataScience/Coursera/ED/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
EPC_subset<-EPC[EPC$Date %in% c("1/2/2007","2/2/2007"),]
GlobalActivePower <- as.numeric(EPC_subset$Global_active_power)
Voltage <- as.numeric(EPC_subset$Voltage)
Global_reactive_power<-as.numeric(EPC_subset$Global_reactive_power)
EPC_subset$Time <- strptime(paste(EPC_subset$Date, EPC_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
EPC_subset$Sub_metering_1<-as.numeric(EPC_subset$Sub_metering_1)
EPC_subset$Sub_metering_2<-as.numeric(EPC_subset$Sub_metering_2)
EPC_subset$Sub_metering_3<-as.numeric(EPC_subset$Sub_metering_3)

# creating matric for graphs with 2 rows and 2 cols
par(mfrow=c(2,2))
plot(datetime,GlobalActivePower,type="l",xlab="",ylab="Global Active Power")
plot(datetime,Voltage,type ="l",xlab="",ylab="Voltage")

#First you need to create a plot then you can add on to it using lines functios.
plot(EPC_subset$Time,EPC_subset$Sub_metering_1,type="l",col="black",xlab ="",ylab="Energy sub metering")
# if you use plot again, it will plot another plot another graph
lines(EPC_subset$Time,EPC_subset$Sub_metering_2,type="l",col="red",xlab ="")
lines(EPC_subset$Time,EPC_subset$Sub_metering_3,type="l",col="blue",xlab ="")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,bty="n",cex=0.5)
# trying to use dev.copy method, here, first you plot on the screen and then can copy to png driver
plot(datetime,Global_reactive_power,type="l",xlab="",ylab="Global_reactive_power")
dev.copy(png,"plot4.png",height=480,width=480)
dev.off()

