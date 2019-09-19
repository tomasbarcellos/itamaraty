context("Busca")

lista <- vector("list", 2)

test_that("Busca funciona como esperado", {
  expect_silent(lista[[1]] <<- buscar_textos("ministerio-da-agricultura"))
  expect_silent(lista[[2]] <<- buscar_textos("Costa Rica"))
})

test_that("Resposta se mantem uniforme", {
  expect_equal(names(lista[[1]]), c("titulo", "data", "texto", "link"))
  expect_equal(names(lista[[2]]), c("titulo", "data", "texto", "link"))
})

test_that("Falha para tags inexistentes", {
  expect_error(buscar_textos("aslkda"), regexp = "== 200")
})


