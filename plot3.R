#plot3.R
#read txt file, extract dates of interest, create DateTime column combining the Date and Time
#columns into a formatted column
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpcOI<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hpcOI$DateTime<-strptime(paste(hpcOI$Date,hpcOI$Time), "%d/%m/%Y %H:%M:%S")
#set png size
png(width=480,height=480,units="px")
#plot3
#Initialist png writer, set plot parameters, create plot
png("plot3.png")
par(mfrow=c(1,1))
with(hpcOI,plot(DateTime,Sub_metering_1,col="black",type="n",xlab=NA,ylab="Energy sub metering"))
with(hpcOI,lines(DateTime,Sub_metering_1,col="black"))
with(hpcOI,lines(DateTime,Sub_metering_2,col="red"))
with(hpcOI,lines(DateTime,Sub_metering_3,col="blue"))
#add legend
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
#close png writer
dev.off()
