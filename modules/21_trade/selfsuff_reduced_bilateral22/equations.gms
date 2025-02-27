*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations
*' In the comparative advantage pool, the active constraint ensures that superregional and thus global supply is larger or equal to demand.
*' This means that production can be freely allocated globally based on comparative advantages.

 q21_trade_glo(k_trade)..
  sum(i2 ,vm_prod_reg(i2,k_trade)) =g=
 sum(i2, vm_supply(i2,k_trade)) + sum(ct,f21_trade_balanceflow(ct,k_trade));

*' amount produced superregionally must be equal to supply + net trade
q21_trade_bilat(h2,k_trade)..
 sum(supreg(h2, i2), vm_prod_reg(i2, k_trade)) =g= sum(supreg(h2,i2), vm_supply(i2, k_trade) -
                              sum(i_ex, v21_trade(i_ex, i2, k_trade))  + sum(i_im, v21_trade(i2, i_im, k_trade)));
*'
*' For non-tradable commodites, the regional supply should be larger or equal to the regional demand.
 q21_notrade(h2,k_notrade)..
  sum(supreg(h2,i2),vm_prod_reg(i2,k_notrade)) =g= sum(supreg(h2,i2), vm_supply(i2,k_notrade));

*' The following equation indicates the regional trade constraint for the self-sufficiency pool.
*' The share of regional demand that has to be fulfilled through the self-sufficiency pool is
*' determined by a trade balance reduction factor for each commodity  `i21_trade_bal_reduction(ct,k_trade)`
*' according to the following equations [@schmitz_trading_2012].
*' If the trade balance reduction equals 1 (`f21_self_suff(ct,i2,k_trade) = 1`), all demand enters the self-sufficiency pool.
*' If it equals 0, all demand enters the comparative advantage pool.

*' Lower bound for production.

 q21_trade_reg(h2,k_trade)..
 sum(supreg(h2,i2),vm_prod_reg(i2,k_trade)) =g=
 ((sum(supreg(h2,i2),vm_supply(i2,k_trade)) + v21_excess_prod(h2,k_trade))
 *sum(ct,i21_trade_bal_reduction(ct,k_trade)))
 $(sum(ct,f21_self_suff(ct,h2,k_trade) >= 1))
 + (sum(supreg(h2,i2),vm_supply(i2,k_trade))*sum(ct,f21_self_suff(ct,h2,k_trade))
 *sum(ct,i21_trade_bal_reduction(ct,k_trade)))
 $(sum(ct,f21_self_suff(ct,h2,k_trade) < 1))
 - v21_import_for_feasibility(h2,k_trade);

*' Upper bound for production.

 q21_trade_reg_up(h2,k_trade) ..
 sum(supreg(h2,i2),vm_prod_reg(i2,k_trade)) =l=
 ((sum(supreg(h2,i2),vm_supply(i2,k_trade)) + v21_excess_prod(h2,k_trade))/sum(ct,i21_trade_bal_reduction(ct,k_trade)))
 $(sum(ct,f21_self_suff(ct,h2,k_trade) >= 1))
 + (sum(supreg(h2,i2),vm_supply(i2,k_trade))*sum(ct,f21_self_suff(ct,h2,k_trade))/sum(ct,i21_trade_bal_reduction(ct,k_trade)))
 $(sum(ct,f21_self_suff(ct,h2,k_trade) < 1));

*' The global excess demand of each tradable good `v21_excess_demad` equals to
*' the sum over all the imports of importing regions.

 q21_excess_dem(k_trade)..
 v21_excess_dem(k_trade) =g=
 (sum(h2, sum(supreg(h2,i2),vm_supply(i2,k_trade))*(1 - sum(ct,f21_self_suff(ct,h2,k_trade)))
 $(sum(ct,f21_self_suff(ct,h2,k_trade)) < 1))
 + sum(ct,f21_trade_balanceflow(ct,k_trade))) + sum(h2, v21_import_for_feasibility(h2,k_trade));

*' Distributing the global excess demand to exporting regions is based on regional export shares [@schmitz_trading_2012].
*' Export shares are derived from FAO data (see @schmitz_trading_2012 for details). They are 0 for importing regions.

 q21_excess_supply(h2,k_trade)..
 v21_excess_prod(h2,k_trade) =e=
 v21_excess_dem(k_trade)*sum(ct,f21_exp_shr(ct,h2,k_trade));

*' Trade tariffs are associated with exporting regions. They are dependent on net exports and tariff levels.
 q21_costs_tariffs(i2,k_trade)..
 v21_cost_tariff_reg(i2,k_trade) =g=
  sum(i_im, sum(ct, i21_trade_tariff(ct, i2,i_im,k_trade)) * v21_trade(i2,i_im,k_trade));
 
*' Trade margins costs assigned currently to exporting region. Margins at region level 
q21_costs_margins(i2,k_trade)..
 v21_cost_margin_reg(i2,k_trade) =g=
  sum(i_im, i21_trade_margin(i2,i_im,k_trade) * v21_trade(i2,i_im,k_trade));

*' regional trade values are the sum of transport margin and tariff costs
q21_cost_trade_reg(i2,k_trade)..
  v21_cost_trade_reg(i2,k_trade) =g=
  v21_cost_tariff_reg(i2,k_trade) + v21_cost_margin_reg(i2,k_trade) 
 + sum(supreg(h2,i2), v21_import_for_feasibility(h2,k_trade)) * s21_cost_import;

*' Regional trade costs are the costs for each region aggregated over all the tradable commodities.
 q21_cost_trade(i2)..
 vm_cost_trade(i2) =e= sum(k_trade, v21_cost_trade_reg(i2,k_trade));
