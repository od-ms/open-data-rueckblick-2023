
## Inspiration für diese Grafik:
## https://de.statista.com/infografik/23799/das-jahr-2020-ein-rueckblick-in-zahlen/

library(grid)
# Docu for gridtext see: https://cran.r-project.org/web/packages/gridtext/readme/README.html
library(gridtext)

ar <- (1+sqrt(5))/2
gl <- grid.layout(1,1,widths=unit(1,"null"), height=unit(1/ar,"null"), respect = TRUE)
grid.newpage()

splot=vpTree(viewport(layout = gl), 
                    vpList(viewport(layout.pos.row = 1, layout.pos.col = 1)))
pushViewport(splot)

grid.rect()
set.seed(51)
for (br in c(0.17,0.53,0.88)) {
  grid.rect(x = c(0.18,0.53, 0.86), y = br,
    width = unit(0.4, "npc"), height = 0.38,
    gp=gpar(fill=sample(c("azure1","azure2","azure3"),3),col="white"))
}
# grid.text("your text", x = 1, y = 1)

gp = gpar(
  col = "black",
  fontfamily = "Helvetica"
)
box_gp = gpar(
  col = "black", fill = NA, lty = 0
)
fsz <- function(txt) {
  return (sub("#SML", "11pt", sub("#TOP", "42pt", sub("#BIG", "32pt", sub("#MID", "17pt", txt)))))
}

text <- c(
  fsz("<span style='font-size:#BIG'>**25**</span> neue<br><span style='font-size:#MID'>Datensätze</span><br>auf dem Open-<br>Data-Portal"),
  fsz("<span style='font-size:#TOP'>**64**</span> <br><span style='font-size:#MID'>Datensätze</span><br><span style='font-size:#SML'>manuell aktualisiert</span>"),
  fsz("<span style='font-size:#BIG'>**40**</span> <span style='font-size:#MID'>Anfragen</span><br>von BürgerInnen<br>nach neuen<br>Datensätzen"),
  fsz("<span style='font-size:#TOP'>**6**</span> <span style='font-size:#MID'>Vorträge</span><br>zu Themen rund<br> um Open Data"),
  fsz("<span style='font-size:#TOP'>**5**</span> <span style='font-size:#MID'>Blog-<br>Artikel</span> zu<br><span style='font-size:#SML'>Hintergrundthemen</span>"),
  fsz("<span style='font-size:#BIG'>**20.000**</span><br><span style='font-size:#MID'>BesucherInnen</span><br>auf dem Open-<br>Data-Portal"),
  fsz("<span style='font-size:#BIG'>**30**</span> mal<br>waren wir bei<br/><span style='font-size:#MID'>Community-</span><br>Treffen in Münster"),
  fsz("<span style='font-size:#BIG'>**10**</span> neue <br><span style='font-size:#MID'>Anwendungen</span><br>von Open Data<br>aus Münster"),
  fsz("<span style='font-size:#BIG'>**4**</span><br><span style='font-size:#MID'>Kooperationen</span><br>mit anderen<br>Kommunen")
#  fsz("<span style='font-size:#BIG'>**30**</span><br><span style='font-size:#MID'>Pizzen</span><br>haben wir<br>ausgegeben")
  
  )

row = c(.73, .38, 0.01)
col = c(0.035,.37, .7)
x <- c(col[1], col[2], col[3], col[1], col[2], col[3], col[1], col[2], col[3])
y <- c(row[1], row[1], row[1], row[2], row[2], row[2]-0.02, row[3], row[3], row[3])


grid.draw(richtext_grob(
  text, x, y, hjust = 0, vjust = 0, 
  padding = unit(c(6, 6, 4, 6), "pt"),
  r = unit(4, "pt"),
  gp = gp, box_gp = box_gp
))

