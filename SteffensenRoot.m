function [Xs] = SteffensenRoot(Fun, Xest)
x0 = Xest;
Imax = 100;
tol = 0.000001;
for i = 1:Imax
Xs = x0 - (Fun(x0)^2)/(Fun(x0 +Fun(x0))-Fun(x0));
toli = abs(x0 - Xs);
if toli < tol
    x0 = Xs;
    exit_msg 'Tolerance satisfied';

elseif i >= Imax 
        x0 = Xs;   
        exit_msg 'Max iterations reached';
    else
        x0 = Xs;
end
disp(Xs);
end
end
