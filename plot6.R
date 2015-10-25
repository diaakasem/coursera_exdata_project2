# Loading utilities and making sure data exists
source('./load_data.R')
# Question :
#
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips ==
# "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?

# Subsetting data
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
# Aggregating
emissions <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
emissions$fips[emissions$fips=="24510"] <- "Baltimore, MD"
emissions$fips[emissions$fips=="06037"] <- "Los Angeles, CA"

library(ggplot2)
png('plot6.png')

g <- ggplot(emissions, aes(factor(year), Emissions))
g <- g +
     facet_grid(. ~ fips)
g <- g +
     geom_bar(stat="identity") +
     xlab("Years") +
     ylab("PM25 Emissions") +
     ggtitle('Emissions From Motor Vehicles in \n Baltimore, MD VS. Los Angeles, CA')

print(g)

dev.off()
