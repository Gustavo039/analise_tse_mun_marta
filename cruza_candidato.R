# CRUZA DADOS SEXO -------------------------------------------------------------
prefeito_partido_sexo = dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, SG_PARTIDO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble()


vereador_partido_sexo = dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, SG_PARTIDO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble()





prefeito_religioso_sexo = dt_candidatos |>
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
  group_by(ANO_ELEICAO, NM_URNA_CANDIDATO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble()

vereador_religioso_sexo = dt_candidatos |>
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
  group_by(ANO_ELEICAO, NM_URNA_CANDIDATO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble()

prefeito_militar_sexo = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(DS_OCUPACAO %in% proxys$nome_militar) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, DS_OCUPACAO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() 


vereador_militar_sexo = 
  dt_candidatos |>
  dtplyr::lazy_dt() |>
  filter(DS_OCUPACAO %in% proxys$nome_militar) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(ANO_ELEICAO, DS_OCUPACAO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) |>
  as_tibble() 




# CRUZA DADOS POPULACAO ---------------------------------------------------

tbl_partido_sexo_populacao = dt_candidatos |>
  dtplyr::lazy_dt() |>
  left_join(df_pop_muni, c('NM_UE', 'SG_UF', 'ANO_ELEICAO')) |>
  as_tibble() |>
  mutate(TAM_POPU = 
           case_when(populacao <= 20000 ~ 'PEQUENO',
                     populacao > 20000 &  populacao <= 100000 ~ 'MEDIO',
                     populacao > 100000 &  populacao <= 500000 ~ 'GRANDE',
                     populacao > 500000 ~ 'GIGANTE'))

prefeito_partido_sexo_populacao = tbl_partido_sexo_populacao |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(TAM_POPU, ANO_ELEICAO, SG_PARTIDO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) 

vereador_partido_sexo_populacao = tbl_partido_sexo_populacao |>
  filter(SG_PARTIDO %in% proxys$partidos) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(TAM_POPU, ANO_ELEICAO, SG_PARTIDO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) 



prefeito_religioso_sexo_populacao = tbl_partido_sexo_populacao |>
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
  group_by(TAM_POPU, ANO_ELEICAO, NM_URNA_CANDIDATO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) 


vereador_religioso_sexo_populacao = tbl_partido_sexo_populacao |>
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
  group_by(TAM_POPU, ANO_ELEICAO, NM_URNA_CANDIDATO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) 

prefeito_militar_sexo_populacao = 
  tbl_partido_sexo_populacao |>
  filter(DS_OCUPACAO %in% proxys$nome_militar) |>
  filter(DS_CARGO == 'PREFEITO') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(TAM_POPU, ANO_ELEICAO, DS_OCUPACAO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) 

vereador_militar_sexo_populacao = 
  tbl_partido_sexo_populacao |>
  filter(DS_OCUPACAO %in% proxys$nome_militar) |>
  filter(DS_CARGO == 'VEREADOR') |>
  mutate(id_cand = 1,
         id_eleito = ifelse(CD_SIT_TOT_TURNO == 1|
                              CD_SIT_TOT_TURNO == 2|
                              CD_SIT_TOT_TURNO == 3, 1, 0)
  ) |>
  group_by(TAM_POPU, ANO_ELEICAO, DS_OCUPACAO, DS_GENERO) |>
  summarise(qtd_candidatos = sum(id_cand),
            qtd_eleitos = sum(id_eleito)) 



#########



prefeito_partido_sexo |>
  as_tibble() |>
  ggplot(aes(x = DS_GENERO, y = qtd_candidatos, fill = DS_GENERO)) +
  geom_col() +
  facet_wrap(~SG_PARTIDO + ANO_ELEICAO)

vereador_militar_sexo |>
  ggplot(aes(x = DS_GENERO, y = qtd_candidatos, fill = DS_GENERO)) +
  geom_col() +
  facet_wrap(~DS_OCUPACAO + ANO_ELEICAO, scales = 'free')


prefeito_partido_sexo_populacao |>
  ggplot(aes(x = SG_PARTIDO, y = qtd_candidatos, fill = DS_GENERO)) +
  geom_col() +
  facet_wrap(~TAM_POPU + ANO_ELEICAO, scales = 'free')
