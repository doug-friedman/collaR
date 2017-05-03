context("extract_cols")

## TODO: Rename context
## TODO: Add more tests

# Removes column printing
options(readr.num_columns = 0)

tf = "mtcars.csv"

## Good reads
test_that("one column", {
  plain_read = read_csv(tf)[,c("mpg"), drop=FALSE]
  pkg_read = extract_cols(tf, c("mpg"), c("d"))
  expect_equivalent(plain_read, pkg_read)
})

test_that("multiple columns", {
  plain_read = read_csv(tf)[,c("mpg", "wt"), drop=FALSE]
  pkg_read = extract_cols(tf, c("mpg", "wt"), c("d", "d"))
  expect_equivalent(plain_read, pkg_read)
})


## Bad reads
test_that("non-character file path", {
  expect_error(extract_cols(12, c("wt"), c("d")), "File information provided is not a character")
})

test_that("invalid file path", {
  expect_error(extract_cols("mtcarz.csv", c("wt"), c("d")), "File path is invalid")
})

test_that("non-character fields", {
  expect_error(extract_cols(tf, c(1), c("d")), "Fields provided are not characters")
})

test_that("non-character field classes", {
  expect_error(extract_cols(tf, c("wt"), c(1)), "Field classes provided are not characters")
})

test_that("invalid field classes", {
  expect_error(extract_cols(tf, c("wt"), c("z")), "Field classes should be one of the following: c, d, i, l")
})

test_that("unequal field and field.class args", {
  expect_error(extract_cols(tf, c("wt"), c("d","d")), "Field class vector and field names are not the same")
})

test_that("invalid column", {
  expect_error(extract_cols(tf, c("wzt"), c("d")), "The specified fields are not present")
})

