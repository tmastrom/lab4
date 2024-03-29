% training script 

close all;
clear all;
clc;
load D_bc_tr.mat;
load D_bc_te.mat;

global ytrain;
global ytest;
global Xtrain;
global Xtest;
global Xhat;
global N;

N = 480;
ytrain = D_bc_tr(31,:);
ytest = D_bc_te(31,:); 

Xtrain = zeros(30,480);
for i = 1:30
 xi = D_bc_tr(i,:);
 mi = mean(xi);
 vi = sqrt(var(xi));
 Xtrain(i,:) = (xi - mi)/vi;
end
Xtest = zeros(30,89);
for i = 1:30
 xi = D_bc_te(i,:);
 mi = mean(xi);
 vi = sqrt(var(xi));
 Xtest(i,:) = (xi - mi)/vi;
end

Xhat = [Xtrain; ones(1,480)];
what = zeros(31,1);

for K=[5 12 75]
    [ws, fs] = grad_desc('objective','gradient',what, 75);

    w = ws(1:30);
    b = ws(31);

    y = sign(w'*Xtest+b);
    correct = sum( y == ytest);
    misclassified = sum( y ~= ytest);
    percent_misclass = 100 * misclassified / length(y);

    false_pos = 0;
    false_neg = 0;
    for i=1:length(y)
        if y(i) == 1 && ytest(i) == -1
            false_pos = false_pos + 1;
        end

        if y(i) == -1 && ytest(i) == 1
            false_neg = false_neg + 1;
        end
    end
    fprintf('============ K = %d ==============\n\n', K);
    fprintf('Misclassified: %f %%\n', percent_misclass);
    fprintf('False Positive: %d, False Negative: %d\n',...
        false_pos, false_neg);
    disp('Solution w =');
    disp(w);
    disp('Solution b =');
    disp(b);
    disp('Function value at solution:');
    disp(fs);

end


% Apply model to the test data
% Y = ws(1:8,:)'*Xte + W(9,:)';   
% err = (norm( (Yte - Yp)  , 'fro')/ norm(Yte, 'fro'));

