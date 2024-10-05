library(raster)
library(terra)

et_ratio <- "/projects/deepnnet/ettest1/et016032/et_inter"
etr <- "/projects/deepnnet/eeflux_et/gridmet"
output <- "/projects/deepnnet/ettest1/et016032"

et_ratio_files <- list.files(et_ratio, pattern = "\\.tif", full.names = TRUE)

extract_doy <- function(filename) {
  doy <- substr(basename(filename), 9, 11)
  return(doy)
}

#change this
year <- 2019

for (et_file in et_ratio_files) {
  
  doy <- extract_doy(et_file)
  
  gridmet_file <- file.path(etr, paste0("etr_", year, "_", doy, ".tif"))
  
  if (file.exists(gridmet_file)) {
    
    et_raster <- rast(et_file)
    
    gridmet_raster <- rast(gridmet_file)
    
    gridmet_raster <- project(gridmet_raster, et_raster)
    
    et_actual_raster <- et_raster * gridmet_raster
    
    output_filename <- file.path(output, paste0("eta_", year, "_", doy, ".tif"))
    
    writeRaster(et_actual_raster, output_filename, overwrite = TRUE)
  } 
}

