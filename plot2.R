# Loading utilities and making sure data exists
source('./load_data.R')
# Question :
#
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question

# Subsetting data
subsetNEI  <- NEI[NEI$fips=="24510", ]
# Aggregating over years
emissions <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=emissions$Emissions,
        names.arg=emissions$year,
        xlab="Years",
        ylab='PM25 emissions',
        main='Total PM25 Emissions in Baltimore City, MD Over Years')
dev.off()
