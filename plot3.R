# Loading utilities and making sure data exists
source('./load_data.R')
# Question :
#
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in
# emissions from 1999–2008?
#
# Use the ggplot2 plotting system to make a plot answer this question.

# Subsetting data
subsetNEI  <- NEI[NEI$fips=="24510", ]
# Aggregating over years
emissions <- aggregate(Emissions ~ year + type, NEI, sum)

library(ggplot2)

png('plot3.png')
g <- ggplot(emissions, aes(year, Emissions, color=type))
g <- g +
     geom_line() +
     xlab("Years") +
     ylab("PM25 Emissions") +
     ggtitle('Emissions in Baltimore City, Maryland')

print(g)

dev.off()
