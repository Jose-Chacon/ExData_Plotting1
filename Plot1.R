plot1<-function(){
     library(sqldf)
     # Load the data from txt file removing observations not necessary for this analysis
     df1<- read.csv.sql("./household_power_consumption.txt", 
                        sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                        ,header = TRUE, sep = ";", stringsAsFactors= FALSE)
     
     closeAllConnections()
     
     # Create histogram 
     hist(df1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)" , main = "Global Active Power" ) 
     
     #Save ploting result to png file
     dev.copy(png, file = "Plot1.png")
     dev.off()

}
     