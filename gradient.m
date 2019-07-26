function g = gradient (w)

global Xhat;
global ytrain;
global N;
% exponential

tot = 0;

for i=1:N
    a = exp(-ytrain(i)*w'*Xhat(:,i));
    curr = Xhat(:,i)*ytrain(i)*a/(1+a);
    tot = tot + curr;
end

g = -1/N*tot;