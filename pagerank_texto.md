---
layout: content
title: PageRank
---

Para usar o PageRank montamos o grafo onde os vertices sao as selecoes e as arestas da selecao i para a selecao j sao as vitorias da selecao j sobre a i.  Os empates geram duas arestas neste grafico.  Os pesos das arestas levam em consideracao a antiguidade do jogo, a importancia (amistoso, jogo de campeonato, etc.) e tambem o numero de jogos que a selecao fez, para evitar que uma selecao consiga bom desempenho no ranking apenas por ter feito muitos jogos contra selecoes mais fracas.

A utilizacao do teorema de Perron-Frobenius para ranking em esportes eh anterior ao PageRank do Google, como descrito no artigo de [Kleene](http://www-stat.wharton.upenn.edu/~steele/Courses/956/Ranking/RankingFootballSIAM93.pdf) de 1993.

