
library(grid)
# Docu for gridtext see: https://cran.r-project.org/web/packages/gridtext/readme/README.html
library(gridtext)

grid.newpage()

gphl = gpar(col = "black",  fontfamily = "Helvetica", fontface="bold", fontsize=9)
gp = gpar(col = "black",  fontfamily = "Helvetica",  fontsize=7)
box_gphl = gpar(col = "black", fill = "azure3", lty = 1)
box_gp = gpar(col = "black", fill = "azure2", lty = 1)

headline <- c(
  "Daten-Visualisierungen",
  "Verbesserung der Datenhaltung",
  "Unterstützung der Open-Data-Community"
)
text <- c(
  "Visualisierungstools wie interaktive Karten, Diagramme und Infografiken können die Zugänglichkeit und Verständlichkeit der bereitgestellten Daten verbessern. Damit kann ein breiteres Spektrum von Nutzern angesprochen werden. Eine gezielte Evaluation und Auswahl geeigneter Visualisierungsmethoden wird angestrebt, um Open Data für eine breitere Zielgruppe zugänglich zu machen und somit die Transparenz und Partizipation zu fördern.",
  "Um die Effizienz der Datenveröffentlichung zu steigern und die Datenhaltung zu verbessern, wird die Entwicklung und Umsetzung einer Datenstrategie sowie einer gemeinsamen technischen Daten-Infrastruktur für die Stadt Münster angestrebt. Die Open-Data-Koordination unterstützt entsprechende Initiativen des Smart City Teams. Eine gute Organisation und Strukturierung städtischer Daten bildet die Grundlage für eine datengetriebene Entscheidungsfindung und Innovation in der Stadtentwicklung.",
  "Vernetzung bietet nicht nur die Möglichkeit, Erfahrungen und Fachkenntnisse von außen einfließen zu lassen, sondern auch potenzielle Partnerschaften zu knüpfen und gemeinsam an Lösungen für lokale Herausforderungen zu arbeiten. Daher wollen wir auch in 2024 bei Veranstaltungen präsent sein und außerdem die Vernetzung mit lokalen Startups sowie der Open-Source-Community suchen. Ein Baustein, der Nachhaltigkeit für Entwicklungen aus der Bürgerschaft schaffen soll, ist das Projekt DIGIFARM.MS, das durch die Open-Data-Initiative unterstützt wird."
)
# grid.roundrect(x=0, y=0, width=.5, height=.1,  gp = gpar(col = "black",  fill = "azure2"))
# grid.roundrect(width=.5, height=.5, gp = gpar(col = "black",  fill = "azure3"))

x <- c(0.001, 0.1, 0.001) # Box x-positions: left, right, left
y <- c(.7, .35, 0.001) # Box y-positions: top, center, bottom
headline_y_offset <- c(0.22, 0.26, 0.26)
maxw <- c(.88, .88, .95) # Bo
for (cc in 1:3)
  grid.draw(textbox_grob(text[cc], 
                     x[cc], y[cc], hjust = 0, vjust = 0, padding = unit(c(8, 10, 8, 10), "pt"),
                     r = unit(4, "pt"), gp = gp, box_gp = box_gp,  maxwidth = maxw[cc]
  ))

y <- y + headline_y_offset
x <- x + 0.05
grid.draw(richtext_grob(headline, 
  x, y, hjust = 0, vjust = 0, padding = unit(c(5, 16, 2, 16), "pt"),
  r = unit(4, "pt"), gp = gphl, box_gp = box_gphl
))

