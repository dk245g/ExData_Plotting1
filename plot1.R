library(dplyr)
Sys.setlocale("LC_ALL","C")
if(!exists("df1")) {
	data<-read.csv('household_power_consumption.txt',sep=";")
	dates<-data$Date=="1/2/2007" | data$Date=="2/2/2007"
	df1<-data[dates,]
}

gap<-df1$Global_active_power %>% as.character %>% as.numeric
hist(gap,
	main="Global Active Power",
	xlab="Global Active Power (kilowatts)",
	ylab="Frequency",
	col="Red")
	
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()