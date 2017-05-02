context("extract_cols")

## TODO: Rename context
## TODO: Add more tests

# Removes column printing
options(readr.num_columns = 0)

tf = file.path("Data", "mtcars.csv")

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
