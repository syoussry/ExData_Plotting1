#######################################
#######################################
## BEFORE PLOTING - COMMON TO ALL FILE

#THE DATA FILE SHOULD BE IN THE ACTIVE REPOSITORY

#first: set your working directory
myWd<-"C:/Users/Selim/Documents/GitHub/ExData_Plotting1"
setwd(myWd)

#set the language in English for times
Sys.setlocale("LC_TIME","English")

#load and preprocess data
colClasses<-c(c("character","character"),rep("numeric",7))
data<-read.table("household_power_consumption.txt",sep=";",
                 colClasses=colClasses,nrows=2075259,
                 header=TRUE,na.strings="?")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
data$newTime<-paste(data$Date,data$Time)
data$newTime<-strptime(data$newTime,format="%Y-%m-%d %H:%M:%S")


#######################################
#######################################
##PLOT 4

png("plot4.png",width=480,height=480)

attach(data)

par(mfrow=c(2,2))

#topleft plot
plot(newTime,Global_active_power,type="n",
     main="",
     xlab="",
     ylab="Global active power"
)
lines(newTime,Global_active_power)

#topright
plot(newTime,Voltage,type="n",
     main="",
     xlab="datetime",
     ylab="Voltage")
lines(newTime,Voltage)

#bottomleft
plot(newTime,Sub_metering_1,type="n",
     main="",
     xlab="",
     ylab="Energy sub metering"
)
lines(newTime,Sub_metering_1,col="black")
lines(newTime,Sub_metering_2,col="red")
lines(newTime,Sub_metering_3,col="blue")
legend("topright",
       lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
        )

#bottomright
plot(newTime,Global_reactive_power,type="n",
     main="",
     xlab="datetime"
)
lines(newTime,Global_reactive_power)

dev.off()