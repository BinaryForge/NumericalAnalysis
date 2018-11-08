function c = divided_diff(x,y,n)
% Newton's divided differences
% x = [0 2 3 1]';
% y = [1 2 4 0]';
n = length(x);
% Matrix used to save divided differences.
F = zeros(n);
F(:,1) = y;
for k = 2 : n
    tm1 = F(k : n,k - 1) - F(k - 1 : n - 1,k - 1);
    tm2 = x(k : n) - x(1 : n - k + 1);
    F(k : n,k) = tm1./tm2;
end
% Plot the polynomial using nested multiplication.
d = n - 1;      % degree of the polynomial
c = diag(F);    % coefficients
b = x(1 : d);   % base points
v = (min(x) : 0.01 : max(x))';        % variable locations
z = mynest(d,c,v,b);                 % nested multiplication

t = 0:0.1:(pi/2);
ori = cos(t);

plot(v,z,'r-',x,y,'o','LineWidth',2);hold on;
plot(t,ori,'color','b') %Plot cos(x)
legend('polynomial','given data','cosx')
xlabel('x')
ylabel('y')
title('Plot of the interpolating polynomial')
    
