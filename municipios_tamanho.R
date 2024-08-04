# POPULACAO ---------------------------------------------------------------
library(basedosdados)

set_billing_id("dadosrais-421300")
query = bdplyr("br_ibge_populacao.municipio") |>
  dplyr::filter(ano == 2016 | ano == 2020)
df_pop_muni_bdplyr = bd_collect(query) 

df_pop_muni = df_pop_muni_bdplyr |>
  dplyr::inner_join(munifacil::depara_muni_codigo() |>
                      select(1:3), 
                    by = 'id_municipio', 
                    relationship = "many-to-many") |>
  mutate(NM_UE = muni_join |>
           stringr::str_to_upper() |>
           abjutils::rm_accent(), .keep = 'unused') |>
  rename(ANO_ELEICAO = ano,
         SG_UF = sigla_uf)



# organiza ----------------------------------------------------------------

dt_candidatos
