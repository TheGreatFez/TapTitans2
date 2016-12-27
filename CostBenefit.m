N = 1000;
Steps = linspace(0,N,N+1)';
Delta_dmg = zeros(N+1,1);
load 'BaseDmgs.mat'
load 'BaseCosts.mat'
Counts = zeros(1,size(BaseCosts,1));
Counts_Plot = zeros(N+1,size(BaseCosts,1));
cost_inc = 0.0788;
Heros_num = size(BaseCosts,1);
Heros_cost = zeros(1,Heros_num);
Heros_delta = zeros(1,Heros_num);
Heros_benefit = zeros(1,Heros_num);
Heros_damage = zeros(1,Heros_num);

Gold_Factor = 1/100;
for i=1:N
    for hero=1:Heros_num
        Heros_cost(hero) = BaseCosts(hero)*exp(Counts(hero)*cost_inc);
        Heros_delta(hero) = DeltaDmg(BaseDmgs(hero),Counts(hero));
        Heros_damage(hero) = TotalDamage(BaseDmgs(hero),Counts(hero));
        if hero == Heros_num
            for hero_ben=1:Heros_num
                Heros_benefit(hero_ben) = Heros_cost(hero_ben)/(Gold_Factor*Heros_delta(hero_ben)) + Heros_cost(hero_ben)/max(0.001,(sum(Heros_damage)));
            end
        end
    end
    
    [m,Best]=min(Heros_benefit);
    Counts(Best) = Counts(Best)+1;
    Counts_Plot(i+1,:) = Counts;
end

plot(Steps,Counts_Plot)
legend('Maya','Zato','Sophia','Lance','Pingo','Rosabella','Gulbrand','Davey','Rhys','Kronus','Cosette','Kiki','Maddie','Beany','Location','northwest')
xlabel('Total Hero Levels')
ylabel('Hero Level')