RMSE.filter <- function(data.file, model.results, output.name) {
  # Takes an input and output file and correlates the input records with the
  # model results having an RSME >= 0.1
  data.file = read.csv(data.file, sep=",", stringsAsFactors=FALSE)
  model.results= read.csv(model.results, sep=",", stringsAsFactors=FALSE)

  model.rmse = subset(model.results, RMSE.. >= 0.1)
  colnames(model.rmse)[4] = "Building.ID"

  data.rmse = model.results[match(model.results$Building.ID, 
                            data.file$Building.ID)]
  data.rmse$Run = model.rmse$Run..
  data.rmse = t(data.rmse)

  write.csv(data.rmse, output.name)

  return(data.rmse)
}

# eRM_NREL_PrimSchl_RMSE = subset(eRM_NREL_PrimSchl, RMSE.. >= 0.1)
# 
# colnames(eRM_NREL_PrimSchl_RMSE)[4] = "Building.ID"
# NREL_PrimSchl_RMSE = NREL_Pri mSchl[match(eRM_NREL_PrimSchl_RMSE$Building.ID, # NREL_PrimSchl$Building.ID),]# 
# NREL_PrimSchl_RMSE = t(NREL_Pr#imSchl_RMSE)# 
# NREL_PrimSchl_RMSE$Run = eRM_NREL_PrimSchl_RMSE$Run..#
# 
#write.csv(NREL_PrimSchl_RMSE, "NREL_PrimSchl_RMSE.csv")