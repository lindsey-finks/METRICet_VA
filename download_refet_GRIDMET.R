### Downloading reference ET from GRIDMET per year:

# This code pulls from a data repository where GRIDMET is stored. 
# There are many variables hosted that you can download individually,
# but for our use we will be using the "etr" data. This is reference 
# ET per year, with daily values for every day of the year. The file 
# extension of the output file is a ".nc" -- or net.cdf -- which is 
# a file type that compresses a lot of data, in this case rater files
# (.tif). In the next step, we will extract each daily raster to get 
#  daily rasters of reference ET for each day of the year. 

library(downloader)

downloader::download(
  url = "http://www.northwestknowledge.net/metdata/data/etr_2020.nc", # change year
  destfile = "Ref_ET_GRIDMET/etr_2020.nc", # change output file name
  mode = 'wb'
)


