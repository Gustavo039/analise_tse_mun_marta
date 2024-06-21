# DEFININDO PROXYS --------------------------------------------------------

proxys = list(
  partidos = 
    c('REPUBLICANOS', 'PSL', 'PATRIOTA' , 'PRB'),
  nome_religioso = 
    c('Pastor', 'Padre', 'Irmã', 
      'Irmão', 'missionário', 'missionária', 
      'bispo', 'apóstolo', 'apóstola', 
      'Reverendo', 'Reverenda', 'Pai', 
      'Mãe', 'Frei', 'Ministro'),
  nome_militar = c('MEMBRO DAS FORÇAS ARMADAS', 'BOMBEIRO MILITAR',
                   'MILITAR REFORMADO', 'POLICIAL CIVIL', 
                   'POLICIAL MILITAR')
) |>
  lapply(function(i){
    i |> 
      stringr::str_to_upper() |>
      abjutils::rm_accent()
  })


# CRIANDO GEOMS -----------------------------------------------------------
# PLOTA PARTIDOS MUNICIPAL ----------------------------------------------------------
prefeito_partido_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                            CD_SIT_TOT_TURNO == 2|
                            CD_SIT_TOT_TURNO == 3, 1, 0)
         ) |>
  group_by(ANO_ELEICAO, NM_UE, SG_UF, SG_PARTIDO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() |>
  left_join(br_geom, by = 'NM_UE') 

vereador_partido_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, NM_UE, SG_UF, SG_PARTIDO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito))|>
  as_tibble() |>
  left_join(br_geom, by = 'NM_UE') 

######

prefeito_religioso_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  mutate(NM_URNA_CANDIDATO = 
           NM_URNA_CANDIDATO |>
           stringr::str_extract("^\\w+")) |>
  filter(NM_URNA_CANDIDATO %in% proxys$nome_religioso) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, NM_UE, SG_UF, NM_URNA_CANDIDATO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() |>
  left_join(br_geom, by = 'NM_UE') 


vereador_religioso_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  mutate(NM_URNA_CANDIDATO = 
           NM_URNA_CANDIDATO |>
           stringr::str_extract("^\\w+")) |>
  filter(NM_URNA_CANDIDATO %in% proxys$nome_religioso) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, NM_UE, SG_UF, NM_URNA_CANDIDATO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() |>
  left_join(br_geom, by = 'NM_UE') 



prefeito_militar_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(DS_OCUPACAO %in% proxys$nome_militar) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, NM_UE, SG_UF, DS_OCUPACAO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() |>
  left_join(br_geom, by = 'NM_UE') 


vereador_militar_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(DS_OCUPACAO %in% proxys$nome_militar) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, NM_UE, SG_UF, DS_OCUPACAO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() |>
  left_join(br_geom, by = 'NM_UE') 

# PLOTA PARTIDOS ESTADUAL ----------------------------------------------------------
prefeito_partido_estadual_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, SG_UF, SG_PARTIDO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() |>
  left_join(estados_geom, by = 'SG_UF') 

vereador_partido_estadual_geom = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, SG_UF, SG_PARTIDO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() |>
  left_join(estados_geom, by = 'SG_UF') 


