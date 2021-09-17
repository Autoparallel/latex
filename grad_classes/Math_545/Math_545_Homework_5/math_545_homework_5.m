% Math 545 Homework 5 Problems


% Problem 2
syms u(x,y,t) m n
L = 2;
H = 1;
k = 1;
A_nm = (4/(pi^2*m*n))*(2*sin(pi*n/4)^2*(cos(pi*m/2)-cos(pi*m))+2*sin(pi*m/4)^2*(cos(pi*n/2)-cos(pi*n)));

u(x,y,t) = symsum(symsum(A_nm*sin(n*pi*x/L)*sin(m*pi*y/H)*exp(-((n^2*pi^2/(L^2))+(m^2*pi^2/(H^2)))*t),m,1,30),n,1,30);

fsurf(u(x,y,10), [0 2 0 1])

% Problem 5
% syms g(x) f(x) F(x) n
% F(x) = 2*symsum(((-1)^(n+1)/n)*sin(n*x),n,1,10);
% fplot(F(x),[-2*pi 2*pi])
% f(x) = 1;
% fplot(f(x),[-2*pi 2*pi])
% g(x) = 2*symsum((-1)^(n+1)*cos(n*x),n,1,100);
% fplot(g(x), [-pi pi])

% Problem 6
% syms f(x) n
% f(x) = symsum(2*(1-cos(pi*n))/(pi*n)*sin(n*x),n,1,50);
% fplot(f(x), [-pi pi])