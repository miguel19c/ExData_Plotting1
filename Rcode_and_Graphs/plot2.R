#Loading the dataset
setwd("C:/Users/0016/Dropbox/Exploratory_Data_Analysis")
data.p1=read.table('household_power_consumption.txt',header=T,sep=';',stringsAsFactors = FALSE)


dates=data.p1$Date
times=data.p1$Time
x=paste(dates,times)
date.time=strptime(x,"%d/%m/%Y %H:%M:%S")

#taking the original dataframe without date and time
data.aux=data.p1[,3:9]

#merge the data/time class with the data.aux dataframe
data=cbind(date.time,data.aux)


#filtering data with dates 2007-02-01 and 2007-02-02.

data.project=data[grep('2007-02-01|2007-02-02',data$date.time),]

#Delete incomplete cases

data.project=data.project[complete.cases(data.project),]

#Data time format to data.time column
data.project$date.time=as.POSIXct(data.project$date.time)


plot(data.project$Global_active_power~data.project$date.time,type='l',xlab='',ylab='Global Active Power (Kilowatts)')

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
