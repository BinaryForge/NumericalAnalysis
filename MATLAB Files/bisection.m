% Alexey Kuznetsov
% Bisection Method Function
% M/CS 375

function [N] = bisection(a,b,TOL)
% [a,b]: interval
% TOL: Given Tolerance
% f is our given function
% n the number of iternation it takes
f = inline('cos(x)');
xc = 0;
N = 0;
fprintf('N \t\t a \t\tb \t\tbc \t\t \n')
if((f(a)*f(b)) > 0)
    N = 10;
    for k = 1 : N
        c = ((a+b)/2);
        fc = f(c);
        if((fc*f(a))<0)
            fprintf('%2d, %12.7f, %12.7f,%12.7f,%12.7f\n', k, a, b, c, fc)
            b = c;
        else
            fprintf('%2d, %12.7f, %12.7f,%12.7f,%12.7f\n', k, a, b, c, fc)
            a = c;
        end 
        if(k == N)
            xc = ((a+b)/2);
        end
    end
    fprintf('The final result is a:%12.7f b:%12.7f xc: %12.7f\n', a,b,xc)
else
    fprintf('Error by IVM: No solution exists')
end
 