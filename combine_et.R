library(terra)

filelist <- "C:/Users/lfink/Desktop/ettest/et014034"

filelist <- list.files(path = filelist, pattern = "^eta_2015.*\\.tif$", full.names = TRUE)

annual_stack <- NULL

# Create an output folder for resampled files
outputFolder <- "../etcombined"
if (!dir.exists(outputFolder)) {
  dir.create(outputFolder)
}

for (i in 1:length(filelist)) {
  # Read the daily ET raster
  daily_et <- rast(filelist[i])
  
  # If it's the first raster, initialize the annual raster; otherwise, add it
  if (is.null(annual_stack)) {
    annual_stack <- daily_et
  } else {
    annual_stack <- annual_stack + daily_et
  }
}

outfile <- paste0(outputFolder, "/eta_014034_2015.tif")
writeRaster(annual_stack[[1]], outfile, overwrite = TRUE)
