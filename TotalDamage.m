function [ dmg ] = TotalDamage( base_dmg,n )
%DAMAGE Summary of this function goes here
%   Detailed explanation goes here
Double_dmg = 2^(min(5,max(0,floor((n+10)/20))));
Triple_dmg = 3^(max(0,floor((n-90)/20)));
Quad_dmg = 4^(max(0,floor((n-210)/20)));
dmg =n*base_dmg*Double_dmg*Triple_dmg*Quad_dmg;

end

