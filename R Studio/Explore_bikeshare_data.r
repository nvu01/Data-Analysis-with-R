
ny = read.csv('new-york-city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

library(ggplot2)

ggplot(data=ny, aes(x=Trip.Duration/60)) +
    geom_histogram(binwidth=5, color=I('black'), fill=I('orange')) + 
    coord_cartesian(xlim = c(0,70)) +
    scale_x_continuous(breaks=seq(0, 70, 5))+
    labs(title="Trip Duration in New York", x = "Trip Duration (Minutes)", y = "Count")

ggplot(data = subset(ny, User.Type != ""), aes(x=User.Type, y = Trip.Duration/60)) +
    geom_bar(stat="summary", fun.y=mean, color=I('black'), fill=I('light blue')) +
    labs(title="Average Trip Duration by User Type in New York ", x = "User Type", y = "Average Trip Duration (Minutes)")

by(ny$Trip.Duration/60, ny$User.Type, mean)

ggplot(data = subset(ny, Gender != ""), aes(x=Gender, y = Trip.Duration/60)) +
    geom_boxplot(color=I('black'), fill=I('light green')) +
    coord_cartesian(ylim=c(0,40))+
    labs(title="Trip Duration by Gender in New York City", x = "Gender", y = "Trip Duration (Minutes)")

by(ny$Trip.Duration/60, ny$Gender, summary)
