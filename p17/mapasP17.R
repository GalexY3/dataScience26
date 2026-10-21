# Wed May 13 12:02:01 2026 ------------------------------
# Alejandro Panera Pascual
# Data science p2

install_github("Modesto-Escobar/evolmap")

library("evolMap")
library("sf")

domi <- st_read("https://raw.githubusercontent.com/scriptorivm/pompeii/master/geojson/domi.geojson")

# Crea un iframe con la info de cada parcela
domi[["info"]] <- paste0(
  '<iframe src="', sub("http:", "https:", domi[["N3"]]), '"></iframe>'
)

# Las parcelas sin info reciben un mensaje por defecto
domi[is.na(domi[["N3"]]), "info"] <- "Sin información disponible"

mapa <- create_map(center = c(40.750556, 14.489722), zoom = 16)
mapa <- add_entities(mapa, domi, info = "info")
plot(mapa, directory = "pompeya")

data <- read.csv(system.file("extdata", "ukr-civharm-2023-02-27.csv",
                             package = "evolMap"))
data[["date"]] <- as.Date(data[["date"]], "%m/%d/%Y")

# Extraer el tipo de incidente del campo "associations"
data[["type"]] <- NA
for(i in seq_len(nrow(data))){
  if(data[i, "associations"] != ""){
    data[i, "type"] <- unlist(strsplit(
      unlist(strsplit(data[i, "associations"], ","))[1], "="))[2]
  }
}
mapa <- create_map(center = c(49.3402, 31.9146), zoom = 6.75)

mapa <- add_markers(mapa, data,
                    color     = "type",
                    latitude  = "latitude",
                    longitude = "longitude",
                    start     = "date")

plot(mapa, dir = "ukraine")
