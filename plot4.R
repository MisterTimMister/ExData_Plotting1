#plot4.R
#read txt file, extract dates of interest, create DateTime column combining the Date and Time
#columns into a formatted column
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpcOI<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hpcOI$DateTime<-strptime(paste(hpcOI$Date,hpcOI$Time), "%d/%m/%Y %H:%M:%S")
#set png size
png(width=480,height=480,units="px")
#plot4
#Initialist png writer, set plot parameters, create plots
png("plot4.png")
par(mfrow=c(2,2))
#4.1
with(hpcOI,plot(DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=NA))
with(hpcOI,lines(DateTime,Global_active_power))
#4.2
with(hpcOI,plot(DateTime,Voltage,type="n",ylab="Voltage",xlab="datetime"))
with(hpcOI,lines(DateTime,Voltage))
#4.3
with(hpcOI,plot(DateTime,Sub_metering_1,col="black",type="n",xlab=NA,ylab="Energy sub metering"))
with(hpcOI,lines(DateTime,Sub_metering_1,col="black"))
with(hpcOI,lines(DateTime,Sub_metering_2,col="red"))
with(hpcOI,lines(DateTime,Sub_metering_3,col="blue"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=1)
#4.4
with(hpcOI,plot(DateTime,Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime"))
with(hpcOI,lines(DateTime,Global_reactive_power))
#close png writer
dev.off()

