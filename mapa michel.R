
 library(ggplot2)
 library(sf)
Linking to GEOS 3.14.1, GDAL 3.12.1, PROJ 9.7.1; sf_use_s2() is TRUE
 library(geobr)
 library(dplyr)

#Anexando pacote: ‘dplyr’

#Os seguintes objetos são mascarados por ‘package:stats’:
  
  filter, lag

#Os seguintes objetos são mascarados por ‘package:base’:
  
  intersect, setdiff, setequal, union
 # 1. Obter a geometria dos estados brasileiros (formato sf)
   mapa_estados <- read_state(year = 2020)
The tzdb package is not installed. Timezones will not be available to Arrow compute functions.
ℹ Using year/date 2020
                    
   # 2. Criar os dados de distribuição normal (variável aleatória)
   set.seed(123) # Define uma semente para reprodutibilidade
 dados_normais <- rnorm(n = nrow(mapa_estados), mean = 50, sd = 10)
 
   # 3. Unir os dados gerados ao mapa
   mapa_estados <- mapa_estados %%
       mutate(valor_distribuicao = dados_normais)
 
   # Criar o mapa com ggplot2
   ggplot(data = mapa_estados) 
       geom_sf(aes(fill = valor_distribuicao), color = "black", size = 0.2) 
       scale_fill_viridis_c(option = "viridis", name = "Valores (Dist. Normal)") 
       labs(
             title = "Mapa de Distribuição Normal no Brasil",
             subtitle = "Exemplo de dados simulados no RStudio",
             caption = "Fonte: Dados simulados via rnorm()"
         ) 
       theme_minimal() 
       theme(
             axis.text = element_blank(),
             axis.ticks = element_blank(),
             panel.grid = element_blank()
         )
 