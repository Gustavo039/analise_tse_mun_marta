uf_codes <- tibble::tibble(
  SG_UF = 
    c("AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"),
  IBGE_UF_CODE = 
    c(12, 27, 16, 13, 29, 23, 53, 32, 52, 21, 51, 50, 31, 15, 25, 41, 26, 22, 33, 24, 43, 11, 14, 42, 35, 28, 17)
)

reg_code =tibble::tibble(
  NAME_RAG = c('Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul'),
  IBGE_REG_CODE = c(1,2,5,3,4) |> as.character()
)


# AGRUPANDO POR REGIAO ----------------------------------------------------
# NOME RELIGIOSO ----------------------------------------------------------
tbl_religioso = dt_candidatos |>
  dtplyr::lazy_dt() |>
  dplyr::mutate(
    NM_URNA_CANDIDATO = 
      NM_URNA_CANDIDATO |>
      stringr::str_extract("^\\w+")
  ) |>
  dplyr::mutate(
    religioso = ifelse(NM_URNA_CANDIDATO %in% proxys$nome_religioso, 1, 0)
  ) |>
  dplyr::mutate(
    id_cand = 1,
    id_eleito = 
      ifelse(
        CD_SIT_TOT_TURNO == 1|
          CD_SIT_TOT_TURNO == 2|
          CD_SIT_TOT_TURNO == 3,
        1, 0
      )
  ) |>
  dplyr::select(
    ANO_ELEICAO, 
    SG_UF,
    DS_CARGO, 
    NM_URNA_CANDIDATO, 
    religioso,
    id_cand, 
    id_eleito
  ) |>
  dplyr::inner_join(uf_codes, by = 'SG_UF') |>
  dplyr::mutate(
    IBGE_REG_CODE = 
      IBGE_UF_CODE |> 
      as.character() |>
      stringr::str_sub(1,1))

# VEREADOR ----------------------------------------------------------------
tbl_vereador_religioso = tbl_religioso |>
  dplyr::filter(DS_CARGO == 'VEREADOR') |>
  dplyr::group_by(ANO_ELEICAO, religioso, IBGE_REG_CODE) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_vereador_religioso_2016 = tbl_vereador_religioso |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

kbl_vereador_religioso_2020 = tbl_vereador_religioso |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |> 
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

# Prefeito ----------------------------------------------------------------
tbl_prefeito_religioso = tbl_religioso |>
  dplyr::filter(DS_CARGO == 'PREFEITO') |>
  dplyr::group_by(ANO_ELEICAO, religioso, IBGE_REG_CODE) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_prefeito_religioso_2016 = tbl_prefeito_religioso |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

kbl_prefeito_religioso_2020 = tbl_prefeito_religioso |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |> 
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)



# MILITAR ----------------------------------------------------------
tbl_militar = dt_candidatos |>
  dtplyr::lazy_dt() |>
  dplyr::mutate(
    DS_OCUPACAO = 
      DS_OCUPACAO |>
      abjutils::rm_accent() |>
      stringr::str_to_upper()
  ) |>
  dplyr::mutate(
    militar = ifelse(DS_OCUPACAO %in% proxys$nome_militar, 1, 0)
  ) |>
  dplyr::mutate(
    id_cand = 1,
    id_eleito = 
      ifelse(
        CD_SIT_TOT_TURNO == 1|
          CD_SIT_TOT_TURNO == 2|
          CD_SIT_TOT_TURNO == 3,
        1, 0
      )
  ) |>
  dplyr::select(
    ANO_ELEICAO, 
    SG_UF,
    DS_CARGO, 
    DS_OCUPACAO, 
    militar,
    id_cand, 
    id_eleito
  ) |>
  dplyr::inner_join(uf_codes, by = 'SG_UF') |>
  dplyr::mutate(
    IBGE_REG_CODE = 
      IBGE_UF_CODE |> 
      as.character() |>
      stringr::str_sub(1,1))

# VEREADOR ----------------------------------------------------------------
tbl_vereador_militar = tbl_militar |>
  dplyr::filter(DS_CARGO == 'VEREADOR') |>
  dplyr::group_by(ANO_ELEICAO, militar, IBGE_REG_CODE) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_vereador_militar_2016 = tbl_vereador_militar |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

kbl_vereador_militar_2020 = tbl_vereador_militar |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |> 
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

# PREFEITO ----------------------------------------------------------------
tbl_prefeito_militar = tbl_militar |>
  dplyr::filter(DS_CARGO == 'PREFEITO') |>
  dplyr::group_by(ANO_ELEICAO, militar, IBGE_REG_CODE) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_prefeito_militar_2016 = tbl_prefeito_militar |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

kbl_prefeito_militar_2020 = tbl_prefeito_militar |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |> 
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)




# AGRUPANDO POR ESTADO ----------------------------------------------------
# NOME RELIGIOSO ----------------------------------------------------------
tbl_religioso_estado = dt_candidatos |>
  dtplyr::lazy_dt() |>
  dplyr::mutate(
    NM_URNA_CANDIDATO = 
      NM_URNA_CANDIDATO |>
      stringr::str_extract("^\\w+")
  ) |>
  dplyr::mutate(
    religioso = ifelse(NM_URNA_CANDIDATO %in% proxys$nome_religioso, 1, 0)
  ) |>
  dplyr::mutate(
    id_cand = 1,
    id_eleito = 
      ifelse(
        CD_SIT_TOT_TURNO == 1|
          CD_SIT_TOT_TURNO == 2|
          CD_SIT_TOT_TURNO == 3,
        1, 0
      )
  ) |>
  dplyr::select(
    ANO_ELEICAO, 
    SG_UF,
    DS_CARGO, 
    NM_URNA_CANDIDATO, 
    religioso,
    id_cand, 
    id_eleito
  ) 

# VEREADOR ----------------------------------------------------------------
tbl_vereador_religioso_estado = tbl_religioso |>
  dplyr::filter(DS_CARGO == 'VEREADOR') |>
  dplyr::group_by(ANO_ELEICAO, religioso, SG_UF) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_vereador_religioso_2016_estado = tbl_vereador_religioso_estado |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)

kbl_vereador_religioso_2020_estado = tbl_vereador_religioso_estado |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)

# Prefeito ----------------------------------------------------------------
tbl_prefeito_religioso_estado = tbl_religioso |>
  dplyr::filter(DS_CARGO == 'PREFEITO') |>
  dplyr::group_by(ANO_ELEICAO, religioso, SG_UF) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_prefeito_religioso_2016_estado = tbl_prefeito_religioso_estado |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)

kbl_prefeito_religioso_2020_estado = tbl_prefeito_religioso_estado |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)



# MILITAR ----------------------------------------------------------
tbl_militar_estado = dt_candidatos |>
  dtplyr::lazy_dt() |>
  dplyr::mutate(
    DS_OCUPACAO = 
      DS_OCUPACAO |>
      abjutils::rm_accent() |>
      stringr::str_to_upper()
  ) |>
  dplyr::mutate(
    militar = ifelse(DS_OCUPACAO %in% proxys$nome_militar, 1, 0)
  ) |>
  dplyr::mutate(
    id_cand = 1,
    id_eleito = 
      ifelse(
        CD_SIT_TOT_TURNO == 1|
          CD_SIT_TOT_TURNO == 2|
          CD_SIT_TOT_TURNO == 3,
        1, 0
      )
  ) |>
  dplyr::select(
    ANO_ELEICAO, 
    SG_UF,
    DS_CARGO, 
    DS_OCUPACAO, 
    militar,
    id_cand, 
    id_eleito
  ) 

# VEREADOR ----------------------------------------------------------------
tbl_vereador_militar_estado = tbl_militar_estado |>
  dplyr::filter(DS_CARGO == 'VEREADOR') |>
  dplyr::group_by(ANO_ELEICAO, militar, SG_UF) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_vereador_militar_2016_estado = tbl_vereador_militar_estado |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)

kbl_vereador_militar_2020_estado = tbl_vereador_militar_estado |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)

# PREFEITO ----------------------------------------------------------------
tbl_prefeito_militar_estado = tbl_militar_estado |>
  dplyr::filter(DS_CARGO == 'PREFEITO') |>
  dplyr::group_by(ANO_ELEICAO, militar, SG_UF) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_prefeito_militar_2016_estado = tbl_prefeito_militar_estado |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)

kbl_prefeito_militar_2020_estado = tbl_prefeito_militar_estado |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = militar) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    SG_UF, 
    7:10) |>
  dplyr::select(SG_UF, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('UF' = 1)




# NOME - PASTOR -----------------------------------------------------------

tbl_pastor = dt_candidatos |>
  dtplyr::lazy_dt() |>
  dplyr::mutate(
    NM_URNA_CANDIDATO = 
      NM_URNA_CANDIDATO |>
      stringr::str_extract("^\\w+")
  ) |>
  dplyr::mutate(
    religioso = ifelse(NM_URNA_CANDIDATO == proxys$nome_religioso[1], 1, 0)
  ) |>
  dplyr::mutate(
    id_cand = 1,
    id_eleito = 
      ifelse(
        CD_SIT_TOT_TURNO == 1|
          CD_SIT_TOT_TURNO == 2|
          CD_SIT_TOT_TURNO == 3,
        1, 0
      )
  ) |>
  dplyr::select(
    ANO_ELEICAO, 
    SG_UF,
    DS_CARGO, 
    NM_URNA_CANDIDATO, 
    religioso,
    id_cand, 
    id_eleito
  ) |>
  dplyr::inner_join(uf_codes, by = 'SG_UF') |>
  dplyr::mutate(
    IBGE_REG_CODE = 
      IBGE_UF_CODE |> 
      as.character() |>
      stringr::str_sub(1,1))

# VEREADOR ----------------------------------------------------------------
tbl_vereador_pastor = tbl_pastor |>
  dplyr::filter(DS_CARGO == 'VEREADOR') |>
  dplyr::group_by(ANO_ELEICAO, religioso, IBGE_REG_CODE) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_vereador_pastor_2016 = tbl_vereador_pastor |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

kbl_pastor_religioso_2020 = tbl_vereador_pastor |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |> 
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

# Prefeito ----------------------------------------------------------------
tbl_prefeito_pastor = tbl_pastor |>
  dplyr::filter(DS_CARGO == 'PREFEITO') |>
  dplyr::group_by(ANO_ELEICAO, religioso, IBGE_REG_CODE) |>
  dplyr::summarise(eleitos = sum(id_eleito),
                   candidatos = sum(id_cand)) |>
  tibble::as_tibble()

kbl_prefeito_pastor_2016 = tbl_prefeito_pastor |>
  dplyr::filter(ANO_ELEICAO == 2016) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |>
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)

kbl_prefeito_pastor_2020 = tbl_prefeito_pastor |>
  dplyr::filter(ANO_ELEICAO == 2020) |>
  tidyr::pivot_wider(values_from = c(eleitos,candidatos), names_from = religioso) |>
  dplyr::mutate(
    'Número de Candidatos' = candidatos_1,
    'Prop de Candidatos' = 
      ((candidatos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = ''),
    'Número de Eleitos' = eleitos_1,
    'Prop de Eleitos' = 
      ((eleitos_1*100)/(candidatos_0 + candidatos_1)) |> 
      round(3) |>
      as.character() |>
      paste("%",sep = '')
  ) |> 
  dplyr::select(
    ANO_ELEICAO , 
    IBGE_REG_CODE , 
    7:10) |>
  dplyr::inner_join(reg_code, by = 'IBGE_REG_CODE') |>
  dplyr::select(IBGE_REG_CODE, NAME_RAG, 
                'Número de Eleitos', 'Prop de Eleitos',
                'Número de Candidatos', 'Prop de Candidatos') |> 
  dplyr::rename('Cod IBGE' = 1,
                'Região' = 2)


# SALVANDO TABELAS EM .rdata ----------------------------------------------

kbl_list = list(
  kbl_vereador_religioso_2016 = kbl_vereador_religioso_2016,
  kbl_vereador_religioso_2020 = kbl_vereador_religioso_2020,
  kbl_prefeito_religioso_2016 = kbl_prefeito_religioso_2016,
  kbl_prefeito_religioso_2020 = kbl_prefeito_religioso_2020,
  kbl_vereador_militar_2016 = kbl_vereador_militar_2016,
  kbl_vereador_militar_2020 = kbl_vereador_militar_2020,
  kbl_prefeito_militar_2016 = kbl_prefeito_militar_2016,
  kbl_prefeito_militar_2020 = kbl_prefeito_militar_2020,
  kbl_vereador_religioso_2016_estado = kbl_vereador_religioso_2016_estado,
  kbl_vereador_religioso_2020_estado = kbl_vereador_religioso_2020_estado,
  kbl_prefeito_religioso_2016_estado = kbl_prefeito_religioso_2016_estado,
  kbl_prefeito_religioso_2020_estado = kbl_prefeito_religioso_2020_estado,
  kbl_vereador_militar_2016_estado = kbl_vereador_militar_2016_estado,
  kbl_vereador_militar_2020_estado = kbl_vereador_militar_2020_estado,
  kbl_prefeito_militar_2016_estado = kbl_prefeito_militar_2016_estado,
  kbl_prefeito_militar_2020_estado = kbl_prefeito_militar_2020_estado
)


saveRDS(kbl_list, "tabelas_tse.rds")



