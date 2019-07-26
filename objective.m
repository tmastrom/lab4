function [f] = objective (w) 

ytrain = importdata("ytrain.mat");
Xtrain = importdata("Xtrain.mat");
% minimize the objective function given by E4.2 
Xtrain = [Xtrain; ones(1,480)];

N = 480;
tot = 0;
for i = 1:N 
    curr = log(1+exp(-ytrain(i)*w'*Xtrain(:,i)));
    tot = tot+curr;
end

f = 1/N*tot;



