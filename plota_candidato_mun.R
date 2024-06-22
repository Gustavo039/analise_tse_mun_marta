library(ggplot2)
library(patchwork)

# PLOTA PARTIDOS MUNICIPAL ----------------------------------------------------------
## Candidato a Prefeito 2016 e 2020
fig_prefeito_partido_cand_2016 = ggplot() +
  geom_sf(data = prefeito_partido_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidatos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO, ncol = 2)

fig_prefeito_partido_cand_2020 = ggplot() +
  geom_sf(data = prefeito_partido_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidatos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO, ncol = 2)

fig_prefeito_partido_cand = (fig_prefeito_partido_cand_2016 +fig_prefeito_partido_cand_2020)
fig_prefeito_partido_cand = fig_prefeito_partido_cand + plot_annotation(
  title = 'Candidatos a Prefeitos Pertencentes a Partidos da Direita Radical',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_prefeito_partido_cand.png', 
       fig_prefeito_partido_cand, 
       width = 10, 
       height = 7)


## Eleito a Prefeito 2016 e 2020
fig_prefeito_partido_eleito_2016 = ggplot() +
  geom_sf(data = prefeito_partido_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO)

fig_prefeito_partido_eleito_2020 = ggplot() +
  geom_sf(data = prefeito_partido_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO)


fig_prefeito_partido_eleito = (fig_prefeito_partido_eleito_2016 + fig_prefeito_partido_eleito_2020)
fig_prefeito_partido_eleito = fig_prefeito_partido_cand + plot_annotation(
  title = 'Eleitos a Prefeitos Pertencentes a Partidos da Direita Radical',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_prefeito_partido_eleito.png', 
       fig_prefeito_partido_eleito, 
       width = 10, 
       height = 7)



## Candidato a Vereador 2016 e 2020
fig_vereador_partido_cand_2016 = ggplot() +
  geom_sf(data = vereador_partido_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidatos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO, ncol = 2)

fig_vereador_partido_cand_2020 = ggplot() +
  geom_sf(data = vereador_partido_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidatos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO, ncol = 2)

fig_vereador_partido_cand = (fig_vereador_partido_cand_2016 +fig_vereador_partido_cand_2020)
fig_vereador_partido_cand = fig_vereador_partido_cand + plot_annotation(
  title = 'Candidatos a Vereadores Pertencentes a Partidos da Direita Radical',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_vereador_partido_cand.png', 
       fig_vereador_partido_cand, 
       width = 10, 
       height = 7)


## Eleito a Vereador 2016 e 2020
fig_vereador_partido_eleito_2016 = ggplot() +
  geom_sf(data = vereador_partido_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO)

fig_vereador_partido_eleito_2020 = ggplot() +
  geom_sf(data = vereador_partido_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~SG_PARTIDO)


fig_vereador_partido_eleito = (fig_vereador_partido_eleito_2016 + fig_vereador_partido_eleito_2020)
fig_vereador_partido_eleito = fig_vereador_partido_eleito + plot_annotation(
  title = 'Eleitos a Vereadores Pertencentes a Partidos da Direita Radical',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_vereador_partido_eleito.png', 
       fig_vereador_partido_eleito, 
       width = 10, 
       height = 7)


# PLOTA NOME RELIGIOSO ----------------------------------------------------
## Candidato a Prefeito 2016 e 2020
fig_prefeito_religioso_cand_2016 = ggplot() +
  geom_sf(data = prefeito_religioso_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_prefeito_religioso_cand_2020 = ggplot() +
  geom_sf(data = prefeito_religioso_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_prefeito_religioso_cand = (fig_prefeito_religioso_cand_2016 + fig_prefeito_religioso_cand_2020)
fig_prefeito_religioso_cand = fig_prefeito_religioso_cand + plot_annotation(
  title = 'Candidatos a Prefeitos com Nomes de Urna Religiosos',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_prefeito_religioso_cand.png', 
       fig_prefeito_religioso_cand, 
       width = 10, 
       height = 7)


## Eleitos a Prefeito 2016 e 2020

fig_prefeito_religioso_eleito_2016 = ggplot() +
  geom_sf(data = prefeito_religioso_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_prefeito_religioso_eleito_2020 = ggplot() +
  geom_sf(data = prefeito_religioso_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_prefeito_religioso_eleito = (fig_prefeito_religioso_eleito_2016 + fig_prefeito_religioso_eleito_2020)
fig_prefeito_religioso_eleito = fig_prefeito_religioso_eleito + plot_annotation(
  title = 'Candidatos a Prefeitos com Nomes de Urna Religiosos',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_prefeito_religioso_eleito.png', 
       fig_prefeito_religioso_eleito, 
       width = 10, 
       height = 7)


## Candidato a Vereador 2016 e 2020

fig_vereador_religioso_cand_2016 = ggplot() +
  geom_sf(data = vereador_religioso_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_vereador_religioso_cand_2020 = ggplot() +
  geom_sf(data = vereador_religioso_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_vereador_religioso_cand = (fig_vereador_religioso_cand_2016 + fig_vereador_religioso_cand_2020)
fig_vereador_religioso_cand = fig_vereador_religioso_cand + plot_annotation(
  title = 'Candidatos a Vereadores com Nomes de Urna Religiosos',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_vereador_religioso_cand.png', 
       fig_vereador_religioso_cand, 
       width = 10, 
       height = 7)


## Eleitos a Vereador 2016 e 2020


fig_vereador_religioso_eleito_2016 = ggplot() +
  geom_sf(data = vereador_religioso_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_vereador_religioso_eleito_2020 = ggplot() +
  geom_sf(data = vereador_religioso_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~NM_URNA_CANDIDATO)

fig_vereador_religioso_eleito = (fig_vereador_religioso_eleito_2016 + fig_vereador_religioso_eleito_2020)
fig_vereador_religioso_eleito = fig_vereador_religioso_eleito + plot_annotation(
  title = 'Eleitos a Vereadores com Nomes de Urna Religiosos',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_vereador_religioso_eleito.png', 
       fig_vereador_religioso_eleito, 
       width = 10, 
       height = 7)



# PLOTA MILITAR ----------------------------------------------------

## Candidato a Prefeito 2016 e 2020
fig_prefeito_militar_cand_2016 = ggplot() +
  geom_sf(data = prefeito_militar_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_prefeito_militar_cand_2020 = ggplot() +
  geom_sf(data = prefeito_militar_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_prefeito_militar_cand = (fig_prefeito_militar_cand_2016 + fig_prefeito_militar_cand_2020)
fig_prefeito_militar_cand = fig_prefeito_militar_cand + plot_annotation(
  title = 'Candidatos a Prefeitos com Nomes de Urna Militares',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_prefeito_militar_cand.png', 
       fig_prefeito_militar_cand, 
       width = 10, 
       height = 7)


## Eleito a Prefeito 2016 e 2020
fig_prefeito_militar_eleito_2016 = ggplot() +
  geom_sf(data = prefeito_militar_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_prefeito_militar_eleito_2020 = ggplot() +
  geom_sf(data = prefeito_militar_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidato') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_prefeito_militar_eleito = (fig_prefeito_militar_eleito_2016 + fig_prefeito_militar_eleito_2020)
fig_prefeito_militar_eleito = fig_prefeito_militar_eleito + plot_annotation(
  title = 'Eleitos a Prefeitos com Nomes de Urna Militares',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_prefeito_militar_eleito.png', 
       fig_prefeito_militar_eleito, 
       width = 10, 
       height = 7)



## Candidato a Vereador 2016 e 2020
fig_vereador_militar_cand_2016 = ggplot() +
  geom_sf(data = vereador_militar_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidatos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_vereador_militar_cand_2020 = ggplot() +
  geom_sf(data = vereador_militar_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_candidatos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Candidatos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_vereador_militar_cand = (fig_vereador_militar_cand_2016 + fig_vereador_militar_cand_2020)
fig_vereador_militar_cand = fig_vereador_militar_cand + plot_annotation(
  title = 'Candidatos a Vereadores com Nomes de Urna Militares',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_vereador_militar_cand.png', 
       fig_vereador_militar_cand, 
       width = 10, 
       height = 7)



## Eleitos a Vereador 2016 e 2020
fig_vereador_militar_eleito_2016 = ggplot() +
  geom_sf(data = vereador_militar_geom |>
            filter(ANO_ELEICAO == 2016), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2016', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_vereador_militar_eleito_2020 = ggplot() +
  geom_sf(data = vereador_militar_geom |>
            filter(ANO_ELEICAO == 2020), 
          mapping = aes(fill = qtd_eleitos, geometry =  geom)) +
  scale_fill_distiller(palette = 1,  
                       direction = 1, 
                       name = 'Num. Eleitos') +
  theme_minimal() +
  labs(title = '2020', size = 14)+
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~DS_OCUPACAO)

fig_vereador_militar_eleito = (fig_vereador_militar_eleito_2016 + fig_vereador_militar_eleito_2020)
fig_vereador_militar_eleito = fig_vereador_militar_eleito + plot_annotation(
  title = 'Eleitos a Vereadores com Nomes de Urna Militares',
  subtitle = 'Visualização Municipal',
  caption = 'Dados: DivulgaCand'
)

ggsave('./plots/fig_vereador_militar_eleito.png', 
       fig_vereador_militar_eleito, 
       width = 10, 
       height = 7)


