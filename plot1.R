#plot1.R
#read txt file, extract dates of interest, create DateTime column combining the Date and Time
#columns into a formatted column
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpcOI<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hpcOI$DateTime<-strptime(paste(hpcOI$Date,hpcOI$Time), "%d/%m/%Y %H:%M:%S")
#set png size
png(width=480,height=480,units="px")
#plot1
#Initialist png writer, set plot parameters, create plot
png("plot1.png")
par(mfrow=c(1,1))
hist(hpcOI[[3]],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#close png writer
dev.off()


