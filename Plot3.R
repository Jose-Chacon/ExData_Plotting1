plot3<-function(){
     library(sqldf)
     # Load the data from txt file removing observations not necessary for this analysis
     df1<- read.csv.sql("./household_power_consumption.txt", 
                        sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                        ,header = TRUE, sep = ";", stringsAsFactors= FALSE)
     
     closeAllConnections()
     
     # Create date/time variable for ploting
     df1$Days<- as.POSIXlt(paste(as.Date(df1$Date, format = "%d/%m/%Y"),df1$Time, sep = " "))
     
     # Create plot 
     plot(df1$Days,  df1$Sub_metering_1,  type ="l" ,  ylab = "Energy sub metering" , xlab ="" )
     lines(df1$Days,  df1$Sub_metering_2, col ="red")
     lines(df1$Days,  df1$Sub_metering_3, col ="blue")
     legend("topright", legend = c("Sub metering 1","Sub metering 2","Sub metering 3") , col=c("black","red", "blue") , lty=1)
     
     #Save ploting result to png file
     dev.copy(png, file = "Plot3.png")
     dev.off()
     
}
