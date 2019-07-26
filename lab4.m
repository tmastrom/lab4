% training script 

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

ytrain = D_bc_tr(31,:);
ytest = D_bc_te(31,:); 