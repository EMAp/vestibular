---
layout: content
title: PageRank
---

O PageRank é um algoritmo usado pelo Google para atribuir importância às páginas da web usando apenas a informação dos links da web.  A idéia central deste algoritmo é a seguinte: a importância de certa página P depende de quantos links apontam para ela.  Mas só o número de links não é suficiente, a importância das páginas que apontam para P também é considerada.

O algoritmo do PageRank está mais detalhado neste [verbete do Wikipedia](http://pt.wikipedia.org/wiki/PageRank).

Embora usado para redes de páginas da Internet, o algoritmo pode ser usado, em princípio, em qualquer rede.
Montamos então a rede das seleções da FIFA onde os vértices são as seleções e as arestas da seleção i para a seleção j são as vitórias da seleção j sobre a i.  Os empates geram duas arestas nesta rede.  Os pesos das arestas levam em consideração há quanto tempo o jogo foi realizado e sua importância (amistoso, jogo de campeonato, etc.) segundo os mesmos critérios que a FIFA usa para realizar seu ranking. Também dividimos o peso das arestas que chegam à seleção i pelo número de jogos em que a seleção i participou, para evitar que uma seleção consiga bom desempenho no ranking apenas por ter feito muitos jogos contra seleções mais fracas.

O resultado do PageRank na rede das seleções pode ser visto [aqui](pagerank_selecoes.html).

Vale a pena destacar que a utilização do teorema de Perron-Frobenius para ranking em esportes é bem anterior ao PageRank do Google, como descrito no artigo de [Kleene](http://www-stat.wharton.upenn.edu/~steele/Courses/956/Ranking/RankingFootballSIAM93.pdf) de 1993.

