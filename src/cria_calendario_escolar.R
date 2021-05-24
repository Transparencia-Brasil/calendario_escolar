
library(tidyverse)
library(bizdays)

data(holidaysANBIMA, package = 'bizdays') # carrega lista de feriados nacionais

feriados_2020 <- holidaysANBIMA[holidaysANBIMA > "2020-01-01" & holidaysANBIMA < "2021-01-01" ]
feriados_adicionais <- c("2020-01-24","2020-01-25")

periodo_nao_letivo_original <-  c(bizseq("2020-01-01", as.Date("2020-01-31")), "2020-01-26", 
                                       bizseq("2020-04-20", as.Date("2020-04-24")), "2020-06-12",
                                              bizseq("2020-07-10", as.Date("2020-07-24")),
                                                     bizseq("2020-10-13", as.Date("2020-10-16")), "2020-10-28")

meus_feriados <- c(feriados_2020, feriados_adicionais, periodo_nao_letivo_original )
(cal_original_sp <- create.calendar("Brazil/ANBIMA", holidays=meus_feriados, weekdays=c("saturday", "sunday")))

dias_letivos_originais <- bizdays("2020-01-07", "2020-12-23", cal_original_sp)


# recessos antes do ensino remoto
recessos_est_sp1 <- bizseq("2020-03-23", as.Date("2020-03-23") +32)
recessos_est_sp_fim_de_ano <- bizseq("2020-12-24", as.Date("2020-12-24") + 8)
aulas_nao_presenciais <- bizseq("2020-04-27", as.Date("2020-03-23") +32)
meus_feriados <- c(holidaysANBIMA, "2020-01-24", "2020-01-25", "2020-01-26", recesso1, )
(cal <- create.calendar("Brazil/ANBIMA", holidays=holidaysANBIMA, weekdays=c("saturday", "sunday")))
bizdays("2020-03-02", "2020-12-31", cal)

as.Date("2020-03-23") + 28