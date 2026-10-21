# Wed May 13 11:10:23 2026 ------------------------------
# Práctica 17 Data science
# Alejandro Panera Pascual

setwd("C:/rstudio/Practica 17/p 17")

#instalación y carga de paquetes

library(devtools)

install_github("Modesto-Escobar/rD3plot")
install_github("Modesto-Escobar/netCoin")
library(netCoin)
library(rD3plot)
library(haven)

data(dice)
head(dice)

#funcion coin
C <- coin(dice[,-1])
C

#Función netcoin
N <- asNodes(C) # node data frame
E <- edgeList(C) # edge data frame
Net <- netCoin(N,E) # network object

data("families")
data("links")

G <- allNet(incidence=links[links$link=="Marriage",-17],
            nodes=families, layout="md", percentages= FALSE,
            criteria="f",minL=1, size="f.Marriages",shape="seat",
            main="Marriage links beetween Italian families",
            note="Data source: Padgett & Ansell (1983)")
H <- allNet(incidence=links[links$link=="Business",-17],
            nodes=families, layout="md", percentages= FALSE,
            criteria="f",minL=1, size="f.Business",shape="seat",
            main="Marriage links beetween Italian families",
            note="Data source: Padgett & Ansell (1983)")

multigraphCreate(Marriage=G,Business=H,dir="italian")













