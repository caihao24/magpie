# ----------------------------------------------------------
# description: Scenarios for FSEMIS CHA
# ----------------------------------------------------------
#### snupe & fertilizer price data
 ### ---------------------prepare patch data----------------------------------
 dir <- "./scripts/start/fsecCHA"
 dir.create("./patch_data")
 # ammend snupe of fertilizer zero growh policy on that of fsdp
 if (!file.exists("./patch_data/50_snupe")){
   dir.create("./patch_data/50_snupe")
 }

 file.copy(from=paste0(dir,"/inputdata/fertilizer/f50_snupe_base.cs4"),
          to="./patch_data/50_snupe/.")
 gms::tardir(dir="patch_data/50_snupe",
 tarfile="patch_data/50_snupe.tgz")
 unlink("patch_data/50_snupe", recursive=TRUE)

 #------fertilizer cost data-----

 ##fertilize cost--Improve the fertilizer costs from 600 to 930of China since 2015
 if (!file.exists("./patch_data/50_fertilizer_costs")){
   dir.create("./patch_data/50_fertilizer_costs")
 }

 file.copy(from=paste0(dir,"/inputdata/fertilizer/f50_fertilizer_costs.cs3"),
          to="./patch_data/50_fertilizer_costs/.")
 gms::tardir(dir="patch_data/50_fertilizer_costs",
 tarfile="patch_data/50_fertilizer_costs.tgz")
 unlink("patch_data/50_fertilizer_costs", recursive=TRUE)

library(gms)

fsemisScenarios <- function(scenario) {

  source("config/default.cfg")

  ############## append snupe data for fertilizer policy reform ################
  cfg$repositories <- append(list("https://rse.pik-potsdam.de/data/magpie/public"=NULL,
                                       "./patch_data"=NULL),
                                      getOption("magpie_repos"))
  x <- list(BAU         = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS","RCP60")),
            SSP1Plus        = list(standard = c("cc", "SSP1", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "SSP1","Popualtion","GDP","SSP1energy", "RCP26")),
            FSDPChina        = list(standard = c("cc", "SSP1", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "Population", "GDP", "Energy",
                                          "AWMS", "Livestock", "NUE", "riceMAC", "Natveg",
                                          "fairTrade", "waterSparing", "allDietAndWaste", "allEmisPrice","SSP1energy","RCP19")),
            Population  = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "Population","RCP60")),
            GDP         = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "GDP","RCP60")),
            Energy      = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "Energy","SSP1energy","RCP60")),
            ImprovAWMS        = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "AWMS","RCP60")),
            Livestock   = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "Livestock","RCP60")),
            NUE         = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "NUE","RCP60")),
            RiceMit        = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "riceMAC","RCP60")),
            Natveg      = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "Natveg","RCP60")),
            Trade       = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "fairTrade","RCP60")),
            Water       = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "waterSparing","RCP60")),
            Food        = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "allDietAndWaste","RCP60")),
            EmisPrice   = list(standard = c("cc", "SSP2", "NDC", "ForestryEndo"),
                               fsemis = c("FSEMIS", "allEmisPrice","RCP60")))

  cfg <- setScenario(cfg, x[[scenario]]$standard)
  cfg <- setScenario(cfg, x[[scenario]]$fsemis, scenario_config = "config/scenario_chafsemis.csv")
  cfg$input['snupe'] <- "50_snupe.tgz"
  cfg$input['fert_cost'] <- "50_fertilizer_costs.tgz"
  cfg$title <- scenario
  cfg$results_folder <- "output/FSEMIS/v5/:title:"
  cfg$output         <- c("extra/disaggregation",
                       "projects/FSEC_nitrogenPollution",
                       "projects/FSEC_water",
                       "rds_report_iso",
                       "rds_report")
  cfg$force_replace <- TRUE

  return (cfg)
}

# ------------------------------------------------------------------------------------------------------------------
# Scenario runs
source("scripts/start_functions.R")
codeCheck <- FALSE

for (scenarioName in c(
  "BAU","FSDPChina","SSP1Plus","Population","GDP","Energy","ImprovAWMS","Livestock",
"NUE","RiceMit","Natveg","Trade","Water","Food","EmisPrice")){
  cfg <- fsemisScenarios(scenario = scenarioName)
  start_run(cfg = cfg, codeCheck = codeCheck)
}
