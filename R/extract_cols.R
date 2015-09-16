#' Quickly read only select columns from a flat file
#'
#' @description Given the file, fields, and their classes,
#'              R will import only the relevant columns.
#' @param file the name of the csv file which the data are to be read from
#' @param fields the names of the columns in the csv that are to be read in
#' @param fields.class the classes of the columns using the readr notation
#'        (c = character, d = double, i = integer, l = logical)
#' @param n_max number of rows to read from the file
#'
#' @return A data frame containing only the specified columns of the data in the file
#' @seealso \code{\link[readr]{read_csv}}
#' @export


extract_cols = function(file="", fields, fields.class, n_max=-1){
  stopifnot(is.character(file), is.character(fields), is.character(fields.class), is.numeric(n_max))
  if(!requireNamespace("readr", quietly = TRUE)) { stop("The readr package is required") }
  
  # Read the first line of the file
  first.line = read_csv(file, n_max = n_max)

  # Check that the fields are present and get their indices
  if(length(fields %in% names(first.line)) == length(fields)){
    fields.ind = which(names(first.line) %in% fields)
  } else{
    print("The specified fields are not present")
  }

  
    
    # Leverages read_csv from the readr if it's available
    skip_code = ""
    for(i in 1:length(names(first.line))){
      if(i %in% fields.ind){
        skip_code = paste0(skip_code, fields.class[which(names(first.line)[i] == fields)])
      } else {
        skip_code = paste0(skip_code, "_")
      }
    }
    return(read_csv(file, col_types = skip_code, n_max=n_max))
  
}
