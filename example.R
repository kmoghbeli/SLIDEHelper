library(SLIDEHelper)
library(ggplot2)


er_path <- "final_delta_0.001_lambda_0.5.rds"
x_path <- "x.csv"
out_path <- "res/"
Z_matrix <- CalcZMatrix(x_path, er_path, out_path)



y_path <- "y.csv"
SLIDE_res <- runSLIDE(y_path = y_path,
                      z_path = NULL,
                      z_matrix = Z_matrix,
                      er_path = er_path, 
                      do_interacts = TRUE,
                      spec = 0.1,
                      niter = 100)

num_top_feats <- 10
condition <- "auc"
SLIDE_res <- GetTopFeatures(x_path, y_path, er_path, out_path, SLIDE_res, num_top_feats = 10, condition)

plotSigGenes(SLIDE_res, out_path, plot_interaction = TRUE)
