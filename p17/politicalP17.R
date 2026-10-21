#Representación de encuestas
# Wed May 13 12:30:38 2026 ------------------------------
#Alejandro Panera Pascual

library(netCoin)
data(ess)
head(ess)


set <- c("Social participation", "Political participation", "Gender", "Age")

essCoin <- surCoin(data = ess, variables = set)
essCoin

plot(essCoin)
