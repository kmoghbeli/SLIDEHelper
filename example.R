library(SLIDEHelper)


er_path <- "/Users/xiaoh/Library/CloudStorage/OneDrive-UniversityofPittsburgh/MI_Spatial/ER_SLIDE/RestingFibro/050123/ER_Results/final_delta_0.01_lambda_0.5.rds"
x_path <- "/Users/xiaoh/Library/CloudStorage/OneDrive-UniversityofPittsburgh/MI_Spatial/ER_SLIDE/RestingFibro/050123/Data/x.csv"
out_path <- "/Users/xiaoh/Desktop/"
Z_matrix <- CalcZMatrix(x_path, er_path, out_path)



y_path <- "/Users/xiaoh/Library/CloudStorage/OneDrive-UniversityofPittsburgh/MI_Spatial/ER_SLIDE/RestingFibro/050123/Data/y.csv"
SLIDE_res <- runSLIDE(y_path = y_path,
                      z_path = NULL,
                      z_matrix = Z_matrix,
                      er_path = er_path, 
                      do_interacts = TRUE,
                      spec = 0.3,
                      niter = 100)

num_top_feats <- 10
condition <- "corr"
SLIDE_res <- GetTopFeatures(x_path, y_path, er_path, out_path, SLIDE_res, num_top_feats = 10, condition = "corr")


