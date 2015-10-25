# Loading utilities and making sure data exists
source('./load_data.R')
# Question :
#
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?

# Matching for coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
# Subsetting data
subsetNEISCC <- NEISCC[coalMatches, ]
# Aggregating
emissions <- aggregate(Emissions ~ year, subsetNEISCC, sum)

library(ggplot2)
png('plot4.png')

g <- ggplot(emissions, aes(factor(year), Emissions))
g <- g +
     geom_bar(stat="identity") +
     xlab("Years") +
     ylab("PM25 Emissions") +
     ggtitle('Emissions From Coal Sources')

print(g)

dev.off()
