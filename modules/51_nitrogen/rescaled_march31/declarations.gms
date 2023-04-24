*** |  (C) 2008-2023 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

variables
 v51_emissions_man_crop_detailed(i,kli,n_pollutants_direct)   n2o emissions from manure on crop
 v51_emissions_resid_detailed(i,kcr,n_pollutants_direct)      n2o emissions from residues decaying
 v51_emissions_resid_burn_detailed(i,kcr,n_pollutants_direct) n2o emissions from residues burning
 v51_emissionbal_awms_detailed(i,kli,n_pollutants_direct)       n2o emissions from awms
 v51_emissionbal_manure_past_detailed(i,kli,n_pollutants_direct)         n2o emissions from manure on pastures
 ;

 equations
 q51_emissions_inorg_fert(i,n_pollutants_direct)   estimates various emission types X from inorganic fertilizer before technical mitigation (Mt X-N)
 q51_emissions_man_crop(i,n_pollutants_direct)     estimates various emission types X from manure on cropland before technical mitigation   (Mt X-N)
 q51_emissions_resid(i,n_pollutants_direct)        estimates various emission types X from residues before technical mitigation            (Mt X-N)
 q51_emissions_resid_burn(i,n_pollutants_direct)   estimates various emission types X from residues burning (Mt X-N)
 q51_emissions_som(i,n_pollutants_direct)          estimates various emission types X from soil organic matter loss before technical mitigation (Mt X-N)
 q51_emissionbal_man_past(i,n_pollutants_direct)   estimates various emission types X from manure on pasture land before technical mitigation (Mt X-N)
 q51_emissionbal_awms(i,n_pollutants_direct)       estimates various emission types X from animal waste management systems before technical mitigation  (Mt X-N)
 q51_emissions_indirect_n2o(i,emis_source_n51)     estimates various emission types X from volatilisation and leaching  (Mt X-N)
 q51_emissions_man_crop_detailed(i,kli,n_pollutants_direct)     estimates various emission types X from manure on cropland before technical mitigation detailed  (Mt X-N)
 q51_emissions_resid_detailed(i,kcr,n_pollutants_direct)        estimates various emission types X from residues before technical mitigation
 q51_emissions_resid_burn_detailed(i,kcr,n_pollutants_direct)   estimates various emission types X from residues burning detailed (Mt X-N)
 q51_emissionbal_awms_detailed(i,kli,n_pollutants_direct)       estimates various emission types X from animal waste management systems before technical mitigation detailed (Mt X-N)
 q51_emissionbal_man_past_detailed(i,kli,n_pollutants_direct)   estimates various emission types X from manure on pasture land before technical mitigation (Mt X-N)
;

parameters
  i51_ef_n_soil(t,i,n_pollutants_direct,emis_source_n_cropsoils51) emission factors for nitrogen emissions from cropland soils (tX-N per tN)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov51_emissions_man_crop_detailed(t,i,kli,n_pollutants_direct,type)      n2o emissions from manure on crop
 ov51_emissions_resid_detailed(t,i,kcr,n_pollutants_direct,type)         n2o emissions from residues decaying
 ov51_emissions_resid_burn_detailed(t,i,kcr,n_pollutants_direct,type)    n2o emissions from residues burning
 ov51_emissionbal_awms_detailed(t,i,kli,n_pollutants_direct,type)        n2o emissions from awms
 ov51_emissionbal_manure_past_detailed(t,i,kli,n_pollutants_direct,type) n2o emissions from manure on pastures
 oq51_emissions_inorg_fert(t,i,n_pollutants_direct,type)                 estimates various emission types X from inorganic fertilizer before technical mitigation (Mt X-N)
 oq51_emissions_man_crop(t,i,n_pollutants_direct,type)                   estimates various emission types X from manure on cropland before technical mitigation   (Mt X-N)
 oq51_emissions_resid(t,i,n_pollutants_direct,type)                      estimates various emission types X from residues before technical mitigation            (Mt X-N)
 oq51_emissions_resid_burn(t,i,n_pollutants_direct,type)                 estimates various emission types X from residues burning (Mt X-N)
 oq51_emissions_som(t,i,n_pollutants_direct,type)                        estimates various emission types X from soil organic matter loss before technical mitigation (Mt X-N)
 oq51_emissionbal_man_past(t,i,n_pollutants_direct,type)                 estimates various emission types X from manure on pasture land before technical mitigation (Mt X-N)
 oq51_emissionbal_awms(t,i,n_pollutants_direct,type)                     estimates various emission types X from animal waste management systems before technical mitigation  (Mt X-N)
 oq51_emissions_indirect_n2o(t,i,emis_source_n51,type)                   estimates various emission types X from volatilisation and leaching  (Mt X-N)
 oq51_emissions_man_crop_detailed(t,i,kli,n_pollutants_direct,type)      estimates various emission types X from manure on cropland before technical mitigation detailed  (Mt X-N)
 oq51_emissions_resid_detailed(t,i,kcr,n_pollutants_direct,type)         estimates various emission types X from residues before technical mitigation
 oq51_emissions_resid_burn_detailed(t,i,kcr,n_pollutants_direct,type)    estimates various emission types X from residues burning detailed (Mt X-N)
 oq51_emissionbal_awms_detailed(t,i,kli,n_pollutants_direct,type)        estimates various emission types X from animal waste management systems before technical mitigation detailed (Mt X-N)
 oq51_emissionbal_man_past_detailed(t,i,kli,n_pollutants_direct,type)    estimates various emission types X from manure on pasture land before technical mitigation (Mt X-N)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
