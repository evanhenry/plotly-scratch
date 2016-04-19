library(gridExtra)
library(hexbin)
library(plotly)
library(ggplot2)
library("stringr")
hives <- read.csv("~/Documents/pltlyhive.csv")
##remove space in hives column
hives$Hive<-str_replace_all(string=hives$Hive, pattern=" ", repl="")

#works fine w/o plotly
plt<- ggplot(hives,aes(x=Temp,y=Humidity)) + geom_hex(bins=20) 
plt + facet_grid( ~ Hive)
ggplotly() ##plotly does not work


pltp<-ggplotly(plt)
pltp #w/ plotly graphs dont render,

hives$Hive<-as.vector(hives$Hive)
