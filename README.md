
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/tomasbarcellos/itamaraty.svg?branch=master)](https://travis-ci.org/tomasbarcellos/itamaraty)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tomasbarcellos/itamaraty?branch=master&svg=true)](https://ci.appveyor.com/project/tomasbarcellos/itamaraty)
[![Coverage
status](https://codecov.io/gh/tomasbarcellos/itamaraty/branch/master/graph/badge.svg)](https://codecov.io/github/tomasbarcellos/itamaraty?branch=master)

# itamaraty

O objetivo de `itamaraty` é baixar textos e discursos do site do
itamaraty.

## Installation

<!-- You can install the released version of itamaraty from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("itamaraty") -->

<!-- ``` -->

Para instalar do Github, rode:

``` r
devtools::install_github("tomasbarcellos/itamaraty")
```

## Exemplo

Um exemplo básico é:

``` r
library(itamaraty)
buscar_textos("República Dominicana")
#> # A tibble: 16 x 4
#>    titulo               data         texto               link              
#>    <chr>                <chr>        <chr>               <chr>             
#>  1 Atos adotados por o… Criado: 14 … "I. ACORDO ENTRE O… http://www.itamar…
#>  2 Visita ao Brasil do… <NA>         ""                  http://www.itamar…
#>  3 Visita ao Brasil do… Criado: 14 … O ministro das Rel… http://www.itamar…
#>  4 Visita ao Brasil do… Criado: 11 … 11h00 – Chegada ao… http://www.itamar…
#>  5 Visita ao Brasil do… Criado: 11 … Informa-se aos pro… http://www.itamar…
#>  6 Furacão Maria        Criado: 19 … O governo brasilei… http://www.itamar…
#>  7 Concessão de agréme… Criado: 20 … O Governo brasilei… http://www.itamar…
#>  8 <NA>                 <NA>         ""                  http://www.itamar…
#>  9 Visita do Ministro … Criado: 19 … O Ministro Mauro V… http://www.itamar…
#> 10 <NA>                 <NA>         ""                  http://www.itamar…
#> 11 <NA>                 <NA>         ""                  http://www.itamar…
#> 12 Conferência Ibero-A… <NA>         Em atualização      http://www.itamar…
#> 13 Fórum de Cooperação… <NA>         O Fórum de Coopera… http://www.itamar…
#> 14 Visita ao Brasil do… Criado: 19 … O Ministro das Rel… http://www.itamar…
#> 15 Participação do Min… Criado: 14 … O Ministro Antonio… http://www.itamar…
#> 16 Cerimônia de Posse … Criado: 07 … O Ministério das R… http://www.itamar…
```
