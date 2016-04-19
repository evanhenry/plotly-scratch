library(plotly)
library(ggplot2)
hives <- read.csv("~/Desktop/sept-oct-data-melted.csv")
str(hives)
#hives$Hive<- lapply(hives$Hive, as.numeric) # make all columns numeric
hives$time<-as.POSIXct(hives$time)

str(hives)

line_plot<-ggplot(data=hives,
  aes(x=time, y=Temp)) +
  xlab("Time") +
  ylab("Temperature °C") +
  #add rect for each wi-fi exposure period
  geom_rect(data=hives, aes(xmin=as.POSIXct("2015-09-25"), xmax=as.POSIXct("2015-09-28"),  ymin=-Inf, ymax=Inf),
            fill="gray", alpha=0.01,   show.legend = TRUE) +
  geom_rect(data=hives, aes(xmin=as.POSIXct("2015-10-01"), xmax=as.POSIXct("2015-10-04"),  ymin=-Inf, ymax=Inf),
          fill="gray", alpha=0.01,   show.legend = TRUE) +
  geom_rect(data=hives, aes(xmin=as.POSIXct("2015-10-07"), xmax=as.POSIXct("2015-10-10"),  ymin=-Inf, ymax=Inf),
          fill="gray", alpha=0.01,   show.legend = TRUE)  +
  geom_line(size = .3, aes(col=Hive)) + theme_gray()

line_plot

ggplotly() ##plotly doesnt render geom_rect

