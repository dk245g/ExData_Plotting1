library(dplyr)
Sys.setlocale("LC_ALL","C")
if(!exists("df1")) {
	data<-read.csv('household_power_consumption.txt',sep=";")
	dates<-data$Date=="1/2/2007" | data$Date=="2/2/2007"
	df1<-data[dates,]
}

datetime<-paste(as.character(df1$Date),as.character(df1$Time)) %>%
	strptime("%d/%m/%Y %H:%M:%S")
sm1<-as.numeric(as.character(df1$Sub_metering_1))
sm2<-as.numeric(as.character(df1$Sub_metering_2))
sm3<-as.numeric(as.character(df1$Sub_metering_3))
plot(datetime,sm1,type="l",xlab="",ylab="Energy sub metering",ylim=c(0,38))
lines(datetime,sm2,type="l",col="red")
lines(datetime,sm3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),text.width=45000,
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()