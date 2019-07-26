function GD(w, N)
% w is the initial point
% N is the number of iterations

xk = w;
% evaluate the gradient function at w 
gk = gradient(xk);
dk = -gk;
ak = bt_lsearch(xk,dk,objective,gradient);
adk = ak*dk; 

i = 0;
while i <= N
  xk = xk + adk;
  gk = feval(gname,xk);
  dk = -gk;
  ak = bt_lsearch(xk,dk,objective(w),gradient(w));
  adk = ak*dk;
  er = norm(adk);
  i = i + 1;
end

disp('solution:')
xs = xk + adk
disp('objective function at solution point:')
fs = feval(fname,xs)
format short
disp('number of iterations performed:')
k



