# GRAFICOS CRUZAMENTOS SEXO POR PARTIDO E ANO----------------------------------------------------
### PREFEITO
fig_cand_prefeito_partido_sexo = prefeito_partido_sexo |>
  ggplot(aes(x = SG_PARTIDO, 
             y = qtd_candidatos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Candidatos a Prefeito por Partido e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE") 

ggsave('./plots/fig_cand_prefeito_partido_sexo.png', 
       fig_cand_prefeito_partido_sexo, 
       width = 10, 
       height = 7)


fig_eleito_prefeito_partido_sexo = prefeito_partido_sexo |>
  ggplot(aes(x = SG_PARTIDO, 
             y = qtd_eleitos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo"))  +
  labs(title = 'Eleitos a Prefeito por Partido e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE") 

ggsave('./plots/fig_eleito_prefeito_partido_sexo.png', 
       fig_eleito_prefeito_partido_sexo, 
       width = 10, 
       height = 7)

### VEREADOR
fig_cand_vereador_partido_sexo = vereador_partido_sexo |>
  ggplot(aes(x = SG_PARTIDO, 
             y = qtd_candidatos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Candidatos a Vereador por Partido e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE") 

ggsave('./plots/fig_cand_vereador_partido_sexo.png', 
       fig_cand_vereador_partido_sexo, 
       width = 10, 
       height = 7)

fig_eleito_vereador_partido_sexo = vereador_partido_sexo |>
  ggplot(aes(x = SG_PARTIDO, 
             y = qtd_eleitos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo"))+
  labs(title = 'Eleitos a Vereador por Partido e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE") 

ggsave('./plots/fig_eleito_vereador_partido_sexo.png', 
       fig_eleito_vereador_partido_sexo, 
       width = 10, 
       height = 7)


## NOME RELIGIOSO E SEXO
### PREFEITO
fig_cand_prefeito_religioso_sexo = prefeito_religioso_sexo |>
  ggplot(aes(x = NM_URNA_CANDIDATO, 
             y = qtd_candidatos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Candidatos a Prefeito por Nome de Urna Religioso e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE") +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))

ggsave('./plots/fig_cand_prefeito_religioso_sexo.png', 
       fig_cand_prefeito_religioso_sexo, 
       width = 10, 
       height = 7)



fig_eleito_prefeito_religioso_sexo = prefeito_religioso_sexo |>
  ggplot(aes(x = NM_URNA_CANDIDATO, 
             y = qtd_eleitos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Eleitos a Prefeito por Nome de Urna Religioso e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE") +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))

ggsave('./plots/fig_eleito_prefeito_religioso_sexo.png', 
       fig_eleito_prefeito_religioso_sexo, 
       width = 10, 
       height = 7)


### VEREADOR
fig_cand_vereador_religioso_sexo = vereador_religioso_sexo |>
  ggplot(aes(x = NM_URNA_CANDIDATO, 
             y = qtd_candidatos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Candidatos a Vereador por Nome de Urna Religioso e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE") +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))

ggsave('./plots/fig_cand_vereador_religioso_sexo.png', 
       fig_cand_vereador_religioso_sexo, 
       width = 10, 
       height = 7)

## CARGO MILITAR E SEXO
### PREFEITO
fig_eleito_prefeito_militar_sexo = prefeito_militar_sexo |>
  ggplot(aes(x = DS_OCUPACAO, 
             y = qtd_eleitos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Eleitos a Prefeito por Cargo e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE") +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1)) 


ggsave('./plots/fig_eleito_prefeito_militar_sexo.png', 
       fig_eleito_prefeito_militar_sexo, 
       width = 10, 
       height = 7)


fig_cand_prefeito_militar_sexo = prefeito_militar_sexo |>
  ggplot(aes(x = DS_OCUPACAO, 
             y = qtd_candidatos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Candidatos a Prefeito por Cargo e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE")  +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))


ggsave('./plots/fig_cand_prefeito_militar_sexo.png', 
       fig_cand_prefeito_militar_sexo, 
       width = 10, 
       height = 7)

### VEREADOR
fig_eleito_vereador_militar_sexo = vereador_militar_sexo |>
  ggplot(aes(x = DS_OCUPACAO, 
             y = qtd_eleitos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Eleitos a Vereador por Cargo e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE")  +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))

ggsave('./plots/fig_eleito_vereador_militar_sexo.png', 
       fig_eleito_vereador_militar_sexo, 
       width = 10, 
       height = 7)


fig_cand_vereador_militar_sexo = vereador_militar_sexo |>
  ggplot(aes(x = DS_OCUPACAO, 
             y = qtd_candidatos, 
             group = DS_GENERO, 
             fill = DS_GENERO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F)  +
  facet_wrap(~ANO_ELEICAO) +
  guides(fill = guide_legend(title = "Sexo")) +
  labs(title = 'Candidatos a Vereador por Cargo e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE")  +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))

ggsave('./plots/fig_cand_vereador_militar_sexo.png', 
       fig_cand_vereador_militar_sexo, 
       width = 10, 
       height = 7)


# CRUZAMENTO POR POP MUNICIPAL --------------------------------------------
# SEXO E PARTIDO ----------------------------------------------------------
fig_cand_prefeito_partido_sexo_populacao = prefeito_partido_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_candidatos, 
             group = SG_PARTIDO, 
             fill = SG_PARTIDO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Partido")) +
  labs(title = 'Candidatos a Prefeito por Partido, Tam. Populacional e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  

ggsave('./plots/fig_cand_prefeito_partido_sexo_populacao.png', 
       fig_cand_prefeito_partido_sexo_populacao, 
       width = 10, 
       height = 7)

fig_eleito_prefeito_partido_sexo_populacao = prefeito_partido_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_eleitos, 
             group = SG_PARTIDO, 
             fill = SG_PARTIDO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Partido")) +
  labs(title = 'Eleitos a Prefeito por Partido, Tam. Populacional e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  

ggsave('./plots/fig_eleito_prefeito_partido_sexo_populacao.png', 
       fig_eleito_prefeito_partido_sexo_populacao, 
       width = 10, 
       height = 7)

fig_cand_vereador_partido_sexo_populacao = vereador_partido_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_candidatos, 
             group = SG_PARTIDO, 
             fill = SG_PARTIDO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Partido")) +
  labs(title = 'Candidatos a Vereador por Partido, Tam. Populacional e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  

ggsave('./plots/fig_cand_vereador_partido_sexo_populacao.png', 
       fig_cand_vereador_partido_sexo_populacao, 
       width = 10, 
       height = 7)


fig_eleito_vereador_partido_sexo_populacao = vereador_partido_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_eleitos, 
             group = SG_PARTIDO, 
             fill = SG_PARTIDO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Partido")) +
  labs(title = 'Eleitos a Vereador por Partido, Tam. Populacional e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  

ggsave('./plots/fig_eleito_vereador_partido_sexo_populacao.png', 
       fig_eleito_vereador_partido_sexo_populacao, 
       width = 10, 
       height = 7)


# NOME DE URNA RELIGIOSO E SEXO -------------------------------------------

fig_cand_prefeito_religioso_sexo_populacao = prefeito_religioso_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_candidatos, 
             group = NM_URNA_CANDIDATO, 
             fill = NM_URNA_CANDIDATO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Nome Religioso")) +
  labs(title = 'Candidatos a Prefeito por Nome de Urna Religioso, Tam. Populacional e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_cand_prefeito_religioso_sexo_populacao.png', 
       fig_cand_prefeito_religioso_sexo_populacao, 
       width = 10, 
       height = 7)


fig_eleito_prefeito_religioso_sexo_populacao = prefeito_religioso_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_eleitos, 
             group = NM_URNA_CANDIDATO, 
             fill = NM_URNA_CANDIDATO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Nome Religioso")) +
  labs(title = 'Eleitos a Prefeito por Nome de Urna Religioso, Tam. Populacional e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_eleito_prefeito_religioso_sexo_populacao.png', 
       fig_eleito_prefeito_religioso_sexo_populacao, 
       width = 10, 
       height = 7)

fig_cand_vereador_religioso_sexo_populacao = vereador_religioso_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_candidatos, 
             group = NM_URNA_CANDIDATO, 
             fill = NM_URNA_CANDIDATO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Nome Religioso")) +
  labs(title = 'Candidatos a Vereador por Nome de Urna Religioso, Tam. Populacional e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_cand_vereador_religioso_sexo_populacao.png', 
       fig_cand_vereador_religioso_sexo_populacao, 
       width = 10, 
       height = 7)


fig_eleito_vereador_religioso_sexo_populacao = vereador_religioso_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_eleitos, 
             group = NM_URNA_CANDIDATO, 
             fill = NM_URNA_CANDIDATO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Nome Religioso")) +
  labs(title = 'Eleitos a Vereador por Nome de Urna Religioso, Tam. Populacional e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_eleito_vereador_religioso_sexo_populacao.png', 
       fig_eleito_vereador_religioso_sexo_populacao, 
       width = 10, 
       height = 7)


# CARGO MILITAR E SEXO ----------------------------------------------------


fig_cand_prefeito_militar_sexo_populacao = prefeito_militar_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_candidatos, 
             group = DS_OCUPACAO, 
             fill = DS_OCUPACAO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Cargo")) +
  labs(title = 'Candidatos a Prefeito por Cargo Policial/Militar, Tam. Populacional e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_cand_prefeito_militar_sexo_populacao.png', 
       fig_cand_prefeito_militar_sexo_populacao, 
       width = 10, 
       height = 7)


fig_eleito_prefeito_militar_sexo_populacao = prefeito_militar_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_eleitos, 
             group = DS_OCUPACAO, 
             fill = DS_OCUPACAO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Cargo")) +
  labs(title = 'Eleitos a Prefeito por Cargo Policial/Militar, Tam. Populacional e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_eleito_prefeito_militar_sexo_populacao.png', 
       fig_eleito_prefeito_militar_sexo_populacao, 
       width = 10, 
       height = 7)

fig_cand_vereador_militar_sexo_populacao = vereador_militar_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_candidatos, 
             group = DS_OCUPACAO, 
             fill = DS_OCUPACAO,
             label = qtd_candidatos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_candidatos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Cargo")) +
  labs(title = 'Candidatos a Vereador por Cargo Policial/Militar, Tam. Populacional e Sexo', 
       y = 'Qtd. de Candidatos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_cand_vereador_militar_sexo_populacao.png', 
       fig_cand_vereador_militar_sexo_populacao, 
       width = 10, 
       height = 7)

fig_eleito_vereador_militar_sexo_populacao = vereador_militar_sexo_populacao |>
  ggplot(aes(x = TAM_POPU, 
             y = qtd_eleitos, 
             group = DS_OCUPACAO, 
             fill = DS_OCUPACAO,
             label = qtd_eleitos)) +
  geom_col(position = "dodge") +
  geom_label(aes(y = qtd_eleitos/2), 
             size = 3, 
             position = position_dodge(0.9), show.legend = F) +
  facet_wrap(~ANO_ELEICAO + DS_GENERO)  +
  guides(fill = guide_legend(title = "Cargo")) +
  labs(title = 'Eleitos a Vereador por Cargo Policial/Militar, Tam. Populacional e Sexo', 
       y = 'Qtd. de Eleitos',
       x = NULL,
       caption = "Dados: TSE e IBGE")  


ggsave('./plots/fig_eleito_vereador_militar_sexo_populacao.png', 
       fig_eleito_vereador_militar_sexo_populacao, 
       width = 10, 
       height = 7)
