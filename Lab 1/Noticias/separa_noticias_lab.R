library("dplyr")
library("readr")

source("mongo_utils.R")

data_inicio = "2014-01-01"
data_fim = "2014-12-31"

build_corpus <- function(conteudo){
  texto <- Corpus(VectorSource(conteudo))
  #texto <- tm_map(texto, tolower)
  texto <- tm_map(texto, removePunctuation, preserve_intra_word_dashes = TRUE)
  #texto <- tm_map(texto, removeWords, stopwords("pt"))
  #texto <- tm_map(texto, removeNumbers)
  #texto <- tm_map(texto, stripWhitespace)
  texto <- tm_map(texto, PlainTextDocument)
  texto <- paste(strwrap(texto[[1]]), collapse = " ")
  return(texto)
}

noticias <- get_collection("estadaoNoticiasProcessadas")
noticias_eleicao = noticias %>% 
  filter(timestamp >= data_inicio & timestamp <= data_fim, titulo != "", conteudo != "") %>%
  select(titulo, conteudo) %>% 
  mutate(idNoticia = 1:n())

conteudo_ = sapply(noticias_eleicao$conteudo, build_corpus)
noticias_eleicao$conteudo = conteudo_

titulo_ = sapply(noticias_eleicao$titulo, build_corpus)
noticias_eleicao$titulo = titulo_

noticias_eleicao = noticias_eleicao %>% arrange(titulo)

write_csv(noticias_eleicao, "noticias_estadao_processado_4.csv")
