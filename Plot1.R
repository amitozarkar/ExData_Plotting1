#Importing file in R
#EPC-Electric power consumption dataset 
EPC <- read.table("C:/Amit/DataScience/Coursera/ED/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
EPC_subset <-EPC[EPC$Date %in% c("1/2/2007","2/2/2007"),]
# as all columns are of character type, need to convert GlobalActivePower to Numeric
GlobalActivePower <- as.numeric(EPC_subset$Global_active_power)
png("plot1.png",width = 480,height = 480)
hist(GlobalActivePower,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
