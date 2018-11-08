%function xn = newtonsys(eps)
%X = NEWTONSYS(EPS)
%INPUT: EPS IS THE ERROR IN WHICH YOU WANT THE ITERATION TO CONTINUE UNTIL
%THE XN IS SMALL ENOUGH
%OUTPUT: XN IS THE SOLUTION TO THE NONLINEAR SYSTEM SOLVED USING NEWTONS
%METHOD

eps = 10^(-8);
%Compute the Jacobian matrix of F
%syms C H W

H = [0.9120 0.9860 1.0600 1.1300 1.1900 1.2600 1.3200 1.3800 1.4100 1.4900];
W = [13.7 15.9 18.5 21.3 23.5 27.2 32.7 36.0 38.6 43.7];
%PD w/ respect to c1, c2
syms c1 c2 
%RMSE
for i= 1:10
        r(i,1) = c1*H(i).^c2-W(i);
end
F = [c1*(H).^c2 - W];
J = jacobian(F);
% Convert F,J and R from symbolic functions to functions
F = matlabFunction(F);
J = matlabFunction(J);
R = matlabFunction(r);

xn = ones(2,1);
err = 1;
k = 0;
plot(k,err,'o')
hold on
while err > eps
    k = k + 1;
    px = xn;
    xn = xn + (-(J(xn(1),xn(2))).'*(J(xn(1),xn(2))))\((J(xn(1),xn(2))).'*(R(xn(1),xn(2))));
    err = norm(xn - px);
    str = sprintf('%10.5f', xn);
    fprintf('%2d %s %12.9f\n',k,str,err)
    plot(k,err,'o')
end
F(xn(1),xn(2))
%  c(0) = (1,1)
%  c(k) = known
%  c(k+1)  = c(k) + -(A(((c(k)))^t(A((c(k))))\(J((c(k))^T)F((c(k)))
 
%Meat of original while loop 
%   k = k + 1;
%     px = xn;
%     xn = xn - J(xn(1),xn(2),xn(3))\F(xn(1),xn(2),xn(3));
%     xn = xn - J(c(1),c(2))
%     err = norm(xn - px);
%     str = sprintf('%10.5f', xn);
%     fprintf('%2d %s %12.9f\n',k,str,err)
%     plot(k,err,'o')