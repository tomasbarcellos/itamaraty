#' Pipe
#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

#' Listar paginas de busca
#'
#' @param tag Tag buscada
#'
#' @return Um vetor com links das paginas da busca
#'
listar_paginas <- function(tag) {
  link <- glue::glue("http://www.itamaraty.gov.br/pt-BR/component/tags/tag/{tag}")

  res <- httr::GET(link)
  stopifnot(httr::status_code(res) == 200)


  contador <- res %>%
    httr::content() %>%
    rvest::html_node(".counter") %>%
    rvest::html_text() %>%
    stringr::str_extract("(?<=de )\\d+") %>%
    as.integer()

  paginas <- if(is.na(contador)) 1 else seq_len(contador)

  glue::glue("{link}?start={(paginas-1)*30}")
}

#' Pegar links para textos
#'
#' @param url link da tela de busca
#'
pegar_links_textos <- function(url) {
  res <- httr::GET(url) %>%
    httr::content()

  hrefs <- res %>%
    rvest::html_node("table") %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href") %>%
    stringr::str_subset("^#$", TRUE)

  glue::glue("http://www.itamaraty.gov.br{hrefs}")
}

#' Pegar Informacoes dos Textos
#'
#' @param url link do texto
#'
pegar_texto <- function(url) {
  res <- httr::GET(url) %>%
    httr::content() %>%
    rvest::html_nodes("div.item-page")

  titulo <- res %>%
    rvest::html_node(".page-header > h1.documentFirstHeading") %>%
    rvest::html_text() %>%
    stringr::str_squish()

  data <- res %>%
    rvest::html_node(".create") %>%
    rvest::html_text() %>%
    stringr::str_squish()

  texto <- res %>%
    rvest::html_nodes("div > p") %>%
    rvest::html_text() %>%
    paste0(collapse = "")

  tibble::tibble(
    titulo = titulo, data = data, texto = texto, link = url
  )
}


#' Buscar textos
#'
#' @param tag Tag buscada
#'
#' @return Uma tibble com as colunas titulo, data, texto e link
#' @export
#'
#' @examples
#' \dontrun{buscar_textos("ministerio-da-agricultura")}
#' \dontrun{buscar_textos("República Dominicana")}
buscar_textos <- function(tag) {
  tag %>%
    stringr::str_replace_all(" ", "-") %>%
    stringi::stri_trans_general("Latin-ASCII") %>%
    stringr::str_to_lower() %>%
    listar_paginas() %>%
    purrr::map(pegar_links_textos) %>%
    purrr::flatten_chr() %>%
    purrr::map_df(pegar_texto)
}
