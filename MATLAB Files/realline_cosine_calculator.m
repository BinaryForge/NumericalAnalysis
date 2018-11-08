function y = realline_cosine_calculator(x) 
start_a = 0; %Choose starting interval 
end_b = 7;   %Choose ending interval
n = 10; %Call Bisection method to achieve desired accuracy
b = ((end_b+start_a)/2)+((end_b-start_a)/2)*cos((1:2:2*n-1)*pi/(2*n)); %Chebyshev Base Points
yb = cos(b); %Chebyshev nodes interpolating polynomial P(X)
c = realline_divided_diff(b',yb',start_a,end_b,n); %Use newton divided differences to determine P(x)
s = 1; 
x1 = mod(x, 2*pi);
if x1 > pi
    x1 = 2*pi-x1;
    s = -1;
end
if x1 > (pi/2)
    x1 = pi-x1;
end
% cos(x)-y
y = s*mynest(n-1,c,x1,b); % Evaluate P(x) at given x1.

error = abs(cos(x)-y);
fprintf('Error: %10d', error)

end

