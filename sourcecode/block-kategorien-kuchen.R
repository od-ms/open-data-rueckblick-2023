
#load ggplot2
library(ggplot2)
library(rlog)
library(dplyr)
library(forcats)

Sys.setenv("LOG_LEVEL" = "ERROR")
rlog::log_info("#### script startup ####")

#create some fake data
data <- read.csv(file = 'data/datensaetze-kategorien-2023.csv', sep=';',
                 dec=",", stringsAsFactors=FALSE,
                 colClasses=c("character", "numeric")
)
#data <- data.frame("category" = c('A', 'B', 'C', 'D', 'E'),
#                   "amount" = c(10, 11, 13, 22, 44))

rlog::log_info("Final Data Frame:")
rlog::log_info(str(data))

data['color'] <- rep("gray70", length(data$kategorie))
data <-
  data |>
  mutate(
    color = case_when(
      row_number() == 1 ~ "goldenrod1",
      row_number() == 2 ~ "mediumpurple1",
      row_number() == 3 ~ "coral2",
      kategorie == "Sonstige" ~ "gray85",
      ## all others should be gray
      TRUE ~ "gray70"
    )
  )

#create chart
data %>%
  mutate(name = fct_reorder(kategorie, anzahl)) %>%
  ggplot( aes(x=name, y=anzahl, fill = color)) +
  geom_col() +
  coord_flip() +
  xlab("") +
  geom_text(
    aes(label = anzahl),
    ## make labels left-aligned
    hjust = 2, nudge_x = 0,
    size = 4, fontface = "bold"# , family = "Fira Sans"
  ) +
  scale_fill_identity(guide = "none") +
  ## get rid of all elements except y axis labels + adjust plot margin
  theme_void() +
  theme(axis.text.y = element_text(size = 12, hjust = 1# , family = "Fira Sans"
                                   ),
        plot.margin = margin(rep(15, 4)))

rlog::log_info("Done Balkendiagramm")