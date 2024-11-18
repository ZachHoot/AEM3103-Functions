% Setup Problem
x = 60;    %ft
V0 = 50;   %ft/sec
Hq = 6.5;  %ft
g = 32.2;  %ft/sec^2

f = @(theta_deg) x * tand(theta_deg) - 0.5 * x.^2*g./V0.^2./cosd(theta_deg).^2 + Hq - 7;

% Visualize & Select an Interval
theta_deg_range = 1:70;
figure
plot(theta_deg_range, f(theta_deg_range));
hold on;
grid on;
imax = 10;
a = 20;
b = 30;
plot([a,b],[0,0]);
hold on;
%Bisection Algorithm
for i = 1:imax
    xns = (a + b)/2;
    toli = abs(a-b);
    tol = 1;
    % Two candidate brackets
    if (f(xns) * f(a)) < 0
        b = xns;
        disp("True");
    else
        a = xns;
        disp("False");
    end
    fprintf("%d %f %f %f %f\n", i , a, b, xns, f(xns));
    disp(a-b);
    hold on;
    plot([a,b], [(i*2),(i*2)], 'linewidth', 2);

    if i == imax
        exit_msg 'Max iterations reached.'
        break
    end
    if toli < tol
        exit_msg 'Tolerance satisfied'
        break
    end
end
plot([a,b], [0,0], 'k*');
%Update Bracket
%View Result