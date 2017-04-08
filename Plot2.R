EPC <- read.table("C:/Amit/DataScience/Coursera/ED/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
EPC_subset<-EPC[EPC$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(EPC_subset$Date, EPC_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower<-as.numeric(EPC_subset$Global_active_power)
plot(datetime,GlobalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
# trying to use dev.copy method, here, first you plot on the screen and then can copy to png driver
dev.copy(png,"plot2.png",height=480,width=480)
dev.off()

