*** |  (C) 2008-2023 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de



*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov53_emissionbal_ch4_awms_detailed(t,i,kli,"marginal") = v53_emissionbal_ch4_awms_detailed.m(i,kli);
 ov53_emissions_resid_burn_detailed(t,i,kcr,"marginal") = v53_emissions_resid_burn_detailed.m(i,kcr);
 oq53_emissionbal_ch4_ent_ferm(t,i,"marginal")          = q53_emissionbal_ch4_ent_ferm.m(i);
 oq53_emissionbal_ch4_awms(t,i,"marginal")              = q53_emissionbal_ch4_awms.m(i);
 oq53_emissionbal_ch4_rice(t,i,"marginal")              = q53_emissionbal_ch4_rice.m(i);
 oq53_emissions_resid_burn(t,i,"marginal")              = q53_emissions_resid_burn.m(i);
 oq53_emissionbal_ch4_awms_detailed(t,i,kli,"marginal") = q53_emissionbal_ch4_awms_detailed.m(i,kli);
 oq53_emissions_resid_burn_detailed(t,i,kcr,"marginal") = q53_emissions_resid_burn_detailed.m(i,kcr);
 ov53_emissionbal_ch4_awms_detailed(t,i,kli,"level")    = v53_emissionbal_ch4_awms_detailed.l(i,kli);
 ov53_emissions_resid_burn_detailed(t,i,kcr,"level")    = v53_emissions_resid_burn_detailed.l(i,kcr);
 oq53_emissionbal_ch4_ent_ferm(t,i,"level")             = q53_emissionbal_ch4_ent_ferm.l(i);
 oq53_emissionbal_ch4_awms(t,i,"level")                 = q53_emissionbal_ch4_awms.l(i);
 oq53_emissionbal_ch4_rice(t,i,"level")                 = q53_emissionbal_ch4_rice.l(i);
 oq53_emissions_resid_burn(t,i,"level")                 = q53_emissions_resid_burn.l(i);
 oq53_emissionbal_ch4_awms_detailed(t,i,kli,"level")    = q53_emissionbal_ch4_awms_detailed.l(i,kli);
 oq53_emissions_resid_burn_detailed(t,i,kcr,"level")    = q53_emissions_resid_burn_detailed.l(i,kcr);
 ov53_emissionbal_ch4_awms_detailed(t,i,kli,"upper")    = v53_emissionbal_ch4_awms_detailed.up(i,kli);
 ov53_emissions_resid_burn_detailed(t,i,kcr,"upper")    = v53_emissions_resid_burn_detailed.up(i,kcr);
 oq53_emissionbal_ch4_ent_ferm(t,i,"upper")             = q53_emissionbal_ch4_ent_ferm.up(i);
 oq53_emissionbal_ch4_awms(t,i,"upper")                 = q53_emissionbal_ch4_awms.up(i);
 oq53_emissionbal_ch4_rice(t,i,"upper")                 = q53_emissionbal_ch4_rice.up(i);
 oq53_emissions_resid_burn(t,i,"upper")                 = q53_emissions_resid_burn.up(i);
 oq53_emissionbal_ch4_awms_detailed(t,i,kli,"upper")    = q53_emissionbal_ch4_awms_detailed.up(i,kli);
 oq53_emissions_resid_burn_detailed(t,i,kcr,"upper")    = q53_emissions_resid_burn_detailed.up(i,kcr);
 ov53_emissionbal_ch4_awms_detailed(t,i,kli,"lower")    = v53_emissionbal_ch4_awms_detailed.lo(i,kli);
 ov53_emissions_resid_burn_detailed(t,i,kcr,"lower")    = v53_emissions_resid_burn_detailed.lo(i,kcr);
 oq53_emissionbal_ch4_ent_ferm(t,i,"lower")             = q53_emissionbal_ch4_ent_ferm.lo(i);
 oq53_emissionbal_ch4_awms(t,i,"lower")                 = q53_emissionbal_ch4_awms.lo(i);
 oq53_emissionbal_ch4_rice(t,i,"lower")                 = q53_emissionbal_ch4_rice.lo(i);
 oq53_emissions_resid_burn(t,i,"lower")                 = q53_emissions_resid_burn.lo(i);
 oq53_emissionbal_ch4_awms_detailed(t,i,kli,"lower")    = q53_emissionbal_ch4_awms_detailed.lo(i,kli);
 oq53_emissions_resid_burn_detailed(t,i,kcr,"lower")    = q53_emissions_resid_burn_detailed.lo(i,kcr);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################

