
#load ggplot2
library(rlog)

Sys.setenv("LOG_LEVEL" = "ERROR")
rlog::log_info("#### script startup ####")

# read datafile
data <- read.csv(file = 'data/datenformate.csv', sep=',',
                 dec=".", stringsAsFactors=FALSE,
                 colClasses=c("character", "numeric")
)

# optional: embed data here
#data <- read.csv(text="Format,Anzahl
#csv,107
#shape,52
#pdf,43
#wfs,43
#geojson,42
#wms,42
#excel,37
#kml,32
#json,17
#...,10
#")

# par() = set graphical parameters
# bg = set background color
# mai = reduce the default giant pie margins (0.3=oben&unten, 1=links&rechts)
par(bg = "aliceblue", mai=c(.3,1,.3,1))

# Add new column for Labels: "$Name ($Anzahl)"
data$Label <- paste0( data$Format, " (", data$Anzahl, ")" )

rlog::log_info("Final Data Frame:")
rlog::log_info(str(data))

# Prepare a color palette with ColorBrewer
library(RColorBrewer)
myPalette <- brewer.pal(12, "Paired")

# Draw pie chart
pie(data$Anzahl, labels = data$Label, border="white", col=myPalette , axes = 0, radius = 1, cex=1.2)


rlog::log_info("Done Balkendiagramm")
