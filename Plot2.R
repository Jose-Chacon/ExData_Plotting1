plot2<-function(){
     library(sqldf)
     # Load the data from txt file removing observations not necessary for this analysis
     df1<- read.csv.sql("./household_power_consumption.txt", 
                        sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                        ,header = TRUE, sep = ";", stringsAsFactors= FALSE)
     
     closeAllConnections()
     
     # Create date/time variable for ploting
     df1$Days<- as.POSIXlt(paste(as.Date(df1$Date, format = "%d/%m/%Y"),df1$Time, sep = " "))
     
     # Create plot 
     plot(df1$Days,  df1$Global_active_power, type ="l" ,  ylab = "Global Active Power (kilowatts)" , xlab ="")
     
     #Save ploting result to png file
     dev.copy(png, file = "Plot2.png")
     dev.off()
     
}
