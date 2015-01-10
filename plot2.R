library(dplyr)
Sys.setlocale("LC_ALL","C")
if(!exists("df1")) {
	data<-read.csv('household_power_consumption.txt',sep=";")
	dates<-data$Date=="1/2/2007" | data$Date=="2/2/2007"
	df1<-data[dates,]
}
gap<-df1$Global_active_power %>% as.character %>% as.numeric
datetime<-paste(as.character(df1$Date),as.character(df1$Time)) %>%
	strptime("%d/%m/%Y %H:%M:%S")
plot(datetime,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()