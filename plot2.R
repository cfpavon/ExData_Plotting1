
library(readr)
library(dplyr)

setwd('C:/Users/Carlos P/Documents/Data Science Coursera/Exploratory Data Analysis/Project1/')


energyColnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                    "Sub_metering_3")

energyData<-read_delim('Fhousehold_power_consumption.zip',delim=';',
                       col_types = list(Date=col_date(format="%d/%m/%Y"),Time=col_time(format="%H:%M:%S"),
                                        Global_active_power=col_double(),
                                        Global_reactive_power=col_double(),
                                        Voltage=col_double(),
                                        Global_intensity=col_double(),
                                        Sub_metering_1=col_double(),
                                        Sub_metering_2=col_double(),
                                        Sub_metering_3=col_double()
                       ),na='?',skip=0)%>%
  filter(Date>='2007-02-01' & Date<='2007-02-02')


energyData=energyData%>%
  mutate(DateTime=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

png(filename = "plot2.png",  width = 480, height = 480, units = "px", pointsize = 12,    bg = "white")
#Sys.setlocale("LC_TIME","English United States")
with(energyData, {plot(DateTime, Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
})
dev.off()

