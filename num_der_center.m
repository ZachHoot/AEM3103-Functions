function [fp_num] = num_der_center(x, y)
drl = length(x);

fp_num = nan*zeros(1, drl);
% Forward distance aprox.
for i = 2:drl-1
    fp_num(i) = (y(i+1) - y(i-1))/(x(i+1) - x(i-1));
end
% Backwards distance aprox.
%fp_num(drl) = (y(drl) -y(drl -1))/(x(drl)-x(drl-1));
end