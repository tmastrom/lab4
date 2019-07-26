function [f] = objective (w) 

% minimize the objective function given by E4.2 

global ytrain;
global Xhat;
global N;

tot = 0;
for i = 1:N 
    curr = log(1+exp(-ytrain(i)*w'*Xhat(:,i)));
    tot = tot+curr;
end

f = 1/N*tot;



