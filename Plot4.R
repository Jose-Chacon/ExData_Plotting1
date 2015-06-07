plot4<-function(){
     library(sqldf)
     # Load the data from txt file removing observations not necessary for this analysis
     df1<- read.csv.sql("./household_power_consumption.txt", 
                        sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                        ,header = TRUE, sep = ";", stringsAsFactors= FALSE)
     
     closeAllConnections()
     
     # Create date/time variable for ploting
     df1$Days<- as.POSIXlt(paste(as.Date(df1$Date, format = "%d/%m/%Y"),df1$Time, sep = " "))
     
     # Set 2x2 cambas
     par(mfrow = c(2,2))
     
     # Create plot 
     plot(df1$Days,  df1$Global_active_power, type ="l" ,  ylab = "Global Active Power (kilowatts)" , xlab ="")

     # Create plot 
     plot(df1$Days,  df1$Voltage,  type ="l" ,  ylab = "Voltage" , xlab = "datetime" )
     
     
     # Create plot 
     plot(df1$Days,  df1$Sub_metering_1,  type ="l" ,  ylab = "Energy sub metering" , xlab ="" )
     lines(df1$Days,  df1$Sub_metering_2, col ="red")
     lines(df1$Days,  df1$Sub_metering_3, col ="blue")
     legend("topright", legend = c("Sub metering 1","Sub metering 2","Sub metering 3") , col=c("black","red", "blue") , lty=1)
     
     
     # Create plot 
     plot(df1$Days,  df1$Global_reactive_power,  type ="l" ,  ylab = "Global_reactive_power" , xlab = "datetime" )
     #Save ploting result to png file
     dev.copy(png, file = "Plot4.png")
     dev.off()
     
}
