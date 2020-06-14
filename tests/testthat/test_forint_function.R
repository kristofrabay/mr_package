library(testthat)
library(mr.kristof)

# what the tests are about

context("making sure forint(42) returns '42 HUF' all the time")


# class / type

test_that("returned object is of string type", {
  expect_type(forint(42), 'character')
  expect_type(forint(420), 'character')
  })


# returned value

test_that("returned object is what it's intended to be", {
  expect_equivalent(forint(42), '42 HUF')
  expect_equivalent(forint(420), '420 HUF')
  })


test_that("returned object is what it's intended to be", {
  expect_equivalent(forint(42), paste0("42", " ", "HUF"))
  expect_equivalent(forint(420), paste0("420", " ", "HUF"))
  })



# input format

test_that("input should always be numeric", {
  expect_error(forint("42"), "non-numeric argument to binary operator")
  expect_error(forint("420"), "non-numeric argument to binary operator")
  })

# run test

devtools::test()
