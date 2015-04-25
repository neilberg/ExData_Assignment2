#Plot3
NEI <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\st\\SkyDrive\\Coursera\\exdata\\A2\\Source_Classification_Code.rds")
library(plyr);library(ggplot2);library(reshape2);library(stringr)

BC1<-NEI[NEI$fips==24510,]
ty11<-BC1[which(BC1$type=="POINT"),]
ty12<-aggregate(ty11[,4], list(ty11$year), sum)
ty12$type<-"POINT"
ty21<-BC1[which(BC1$type=="NONPOINT"),]
ty22<-aggregate(ty21[,4], list(ty21$year), sum)
ty22$type<-"NONPOINT"
ty31<-BC1[which(BC1$type=="ON-ROAD"),]
ty32<-aggregate(ty31[,4], list(ty31$year), sum)
ty32$type<-"ON-ROAD"
ty41<-BC1[which(BC1$type=="NON-ROAD"),]
ty42<-aggregate(ty41[,4], list(ty41$year), sum)
ty42$type<-"NON-ROAD"

st1<-rbind(ty12,ty22,ty32,ty42)
p1<-qplot(year, em,data=st1[which(st1$year==c("1999","2008")),],color=type,geom=c("line","point")) #x,y,df 
p1
