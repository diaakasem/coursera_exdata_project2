# Making Sure that the data is loaded, and loading it for one time only
if (!exists("NEI")) {
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}

if (!exists("SCC")) {
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

if(!exists("NEISCC")){
    NEISCC <- merge(NEI, SCC, by="SCC")
}

