function [ delta_dmg ] = DeltaDmg( base_dmg,n )
%DELTADMG Summary of this function goes here
%   Detailed explanation goes here

dmg1 = TotalDamage(base_dmg,n);
n = n+1;
dmg2 = TotalDamage(base_dmg,n);
delta_dmg = dmg2-dmg1;
end

