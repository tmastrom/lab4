function g = gradient (w)

ytrain = importdata("ytrain.mat");
Xtrain = importdata("Xtrain.mat");
Xtrain = [Xtrain; ones(1,480)];

% exponential
N = 480;
tot = 0;

for i=1:N
    curr = ytrain(i)*exp(-ytrain(i)*w'*Xtrain(:,i))/(1+exp(-ytrain(i)*w'*Xtrain(:,i)));
    tot = tot + curr;
end

g = -1/N*tot;