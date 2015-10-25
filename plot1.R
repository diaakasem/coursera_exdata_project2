# Loading utilities and making sure data exists
source('./load_data.R')
# Question :
#
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Aggregating over years
emissions <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=emissions$Emissions,
        names.arg=emissions$year,
        xlab="Years",
        ylab='PM25 emissions',
        main='Total PM25 Emissions Over Years')
dev.off()
