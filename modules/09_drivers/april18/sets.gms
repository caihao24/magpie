*** |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

sets
   pop_gdp_scen09  Population and GDP scenario
       / SSP1, SSP2, SSP3, SSP4, SSP5,
         SDP, SDP_EI, SDP_MC, SDP_RC, SSP2EU,
         a1, a2, b1, b2 /

  pal_scen09  Physical activity level scenario
       / SSP1, SSP2, SSP3, SSP4, SSP5 /

  demography_scen09  Demography scenario
       / SSP1, SSP2, SSP3, SSP4, SSP5 /

   age Population age groups
       / 0--4, 5--9,   10--14, 15--19,
       20--24, 25--29, 30--34, 35--39,
       40--44, 45--49, 50--54, 55--59,
       60--64, 65--69, 70--74, 75--79
       80--84, 85--89, 90--94, 95--99, 100+ /

   sex Sex groups
       /M, F/

  pop_structure(demography_scen09,pop_gdp_scen09) Mapping between demography and population scenarios
       /
       SSP1        . (SSP1, SDP, SDP_EI, SDP_MC, SDP_RC)
       SSP2        . (SSP2, SSP2EU)
       SSP3        . (SSP3)
       SSP4        . (SSP4)
       SSP5        . (SSP5)
       /

  iso_cha(iso) countries to be applied SSP settings
           /CHN, HKG, MAC, TWN/

  iso_noncha(iso) iso list of noncha countries
             / ABW, AFG, AGO, AIA, ALA, ALB, AND, ARE, ARG, ARM, ASM, ATA, ATF, ATG,
               AUS, AUT, AZE, BDI, BEL, BEN, BES, BFA, BGD, BGR, BHR, BHS, BIH, BLM,
               BLR, BLZ, BMU, BOL, BRA, BRB, BRN, BTN, BVT, BWA, CAF, CAN, CCK,CHE,
               CHL, CIV, CMR, COD, COG, COK, COL, COM, CPV, CRI, CUB, CUW, CXR,
               CYM, CYP, CZE, DEU, DJI, DMA, DNK, DOM, DZA, ECU, EGY, ERI, ESH, ESP,
               EST, ETH, FIN, FJI, FLK, FRA, FRO, FSM, GAB, GBR, GEO, GGY, GHA, GIB,
               GIN, GLP, GMB, GNB, GNQ, GRC, GRD, GRL, GTM, GUF, GUM, GUY, HMD,
               HND, HRV, HTI, HUN, IDN, IMN, IND, IOT, IRL, IRN, IRQ, ISL, ISR, ITA,
               JAM, JEY, JOR, JPN, KAZ, KEN, KGZ, KHM, KIR, KNA, KOR, KWT, LAO, LBN,
               LBR, LBY, LCA, LIE, LKA, LSO, LTU, LUX, LVA, MAF, MAR, MCO, MDA,MDG, MDV,
               MEX, MHL, MKD, MLI, MLT, MMR, MNE, MNG, MNP, MOZ, MRT, MSR,
               MTQ, MUS, MWI, MYS, MYT, NAM, NCL, NER, NFK, NGA, NIC, NIU, NLD, NOR,
               NPL, NRU, NZL, OMN, PAK, PAN, PCN, PER, PHL, PLW, PNG, POL, PRI, PRK,
               PRT, PRY, PSE, PYF, QAT, REU, ROU, RUS, RWA, SAU, SDN, SEN, SGP, SGS,
               SHN, SJM, SLB, SLE, SLV, SMR, SOM, SPM, SRB, SSD, STP, SUR, SVK, SVN,
               SWE, SWZ, SXM, SYC, SYR, TCA, TCD, TGO, THA, TJK, TKL, TKM, TLS, TON,
               TTO, TUN, TUR, TUV, TZA, UGA, UKR, UMI, URY, USA, UZB, VAT, VCT,
               VEN, VGB, VIR, VNM, VUT, WLF, WSM, YEM, ZAF, ZMB, ZWE /

  i_cha(i) china
    /CHA/

  i_noncha(i) non china
  / ANZ, BRA, CAN, EUR, IND, JKO, LAM, MEA, NEA, NEU, OAS, SSA, USA /

;
