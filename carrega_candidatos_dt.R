# pacotes -----------------------------------------------------------------
library(electionsBR)
library(dtplyr)
library(tidyverse)
# CARREGANDO DADOS BASES DE CANDIDATOS ------------------------------------
dt_candidatos_2016 = elections_tse(year = 2016,
                              type = 'candidate',
                              data_table = T) |>
  dtplyr::lazy_dt() |>
  filter(
    DS_SITUACAO_CANDIDATO_TOT %in% c('Deferido', 'Deferido com recurso', 'Apto')
  ) |>
  mutate(NM_UE = NM_UE |>
             stringr::str_to_upper() |>
             abjutils::rm_accent(), .keep = 'unused') 

dt_candidatos_2020 = elections_tse(year = 2020,
                                   type = 'candidate',
                                   data_table = T) |>
  dtplyr::lazy_dt() |>
  filter(
    DS_SITUACAO_CANDIDATO_TOT %in% c('Deferido', 'Deferido com recurso', 'Apto')
  ) |>
  mutate(NM_UE = NM_UE |>
           stringr::str_to_upper() |>
           abjutils::rm_accent(), .keep = 'unused') 

dt_candidatos = 
  data.table::rbindlist(
    list(dt_candidatos_2016 |> data.table::as.data.table(), 
         dt_candidatos_2020 |> data.table::as.data.table()),
    use.names = F, fill = T)

dt_candidatos = dt_candidatos[, NM_UE := abjutils::rm_accent(stringr::str_to_upper(NM_UE))]


dt_candidatos |>
  dtplyr::lazy_dt() |>
  mutate(
    SG_PARTIDO = 
      dplyr::case_when(SG_PARTIDO == 'PRB' | 
                       SG_PARTIDO == 'REPUBLICANOS' ~ 'PRB/REPUBLICANOS',
                       .default = ~.)
        )



