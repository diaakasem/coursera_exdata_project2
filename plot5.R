# Loading utilities and making sure data exists
source('./load_data.R')
# Question :
#
# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City?

# Subsetting data
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
# Aggregating
emissions <- aggregate(Emissions ~ year, subsetNEI, sum)

library(ggplot2)
png('plot5.png')

g <- ggplot(emissions, aes(factor(year), Emissions))
g <- g +
     geom_bar(stat="identity") +
     xlab("Years") +
     ylab("PM25 Emissions") +
     ggtitle('Emissions From Motor Vehicles in Baltimore City')

print(g)

dev.off()
