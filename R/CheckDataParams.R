
yaml_path <- "/Users/xiaoh/Desktop/Research/MI_Spatial/RestingFibro/050123/pipeline3.yaml"

CheckDataParams <- function(yaml_path, x_path, y_path){
  x <- as.matrix(utils::read.csv(x_path, row.names = 1))
  y <- as.matrix(utils::read.csv(y_path, row.names = 1))
  er_input <- yaml::yaml.load_file(yaml_path)
  
  ##################################################################
  ##                          check data                          ##
  ##################################################################
  # check col names
  if (is.null(names(as.data.frame(x))) == TRUE){stop("No feature names found for the X matrix, please add column names...")}
  if (is.null(names(as.data.frame(y))) == TRUE){stop("No column name found for the Y vector, please add column name...")}
  # check the dimensions  
  if (dim(x)[1] != length(y)) {stop("The number of samples of data and response matrix does not match or data matrix needs to be transposed.")}
  
  
  ##################################################################
  ##                          check yaml                          ##
  ##################################################################
  if ((length(y) <= 20) & (er_input$k != length(y))) {warning("The number of data points are low and cross validation is not set to leave-one-out. We recommend setting k as number of samples...")}
}