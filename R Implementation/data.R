# install and load relevant libraries
install.packages("ggplot2") 
install.packages("RColorBrewer")
library(ggplot2)
library(reshape2)

#reads the raw data into R and saves it as "datapoints" variable
datapoints <- read.csv("R_data.csv")
data.frame(datapoints)
names(datapoints) <- tolower(names(datapoints)) #makes all headings underscore
head(datapoints)   #displays the first few values of the dataset

# creates the scatterplot
# The color palette hex values were taken from colorBrewer's Paired color palette. 2 additional colors were added: Black and White
scatterplot <- ggplot(datapoints, aes(x=first.degree, y=apartment.worth, color=locality)) + geom_point( shape=1, size = 5) + expand_limits(y=c(0,40000)) + expand_limits(x=c(0,60)) + scale_color_manual(name="City",values=c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", "#fdbf6f", "#ff7f00", "#cab2d6", "#6a3d9a", "black", "white","#ffff99", "#b15928"))

# Changes graph title, axes titles, and legend title
scatterplot + ylab("Average Apartment value (Shekels/square meter)") + xlab("Percentage of Residents Ages 20-55 with an Undergraduate Degree") + ggtitle("The Relationship between Educational attainment and Real State Value in Israel") 

