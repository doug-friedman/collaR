context("extract_cols")

## TODO: Rename context
## TODO: Add more tests


tf = tempfile()
write.csv(mtcars, tf, row.names=F)

test_that("one column", {
  expect_equal(read_csv(tf)[,c("mpg"), drop=FALSE], extract_cols(tf, c("mpg"), c("d")))
})

test_that("multiple columns", {
  expect_equal(read_csv(tf)[,c("mpg", "wt"), drop=FALSE], extract_cols(tf, c("mpg", "wt"), c("d", "d")))
})
