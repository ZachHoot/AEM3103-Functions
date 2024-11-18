%function I = num_integration (f, a, b, n, method)
function I = num_integration(varargin)

if length(varargin) == 3
    x = varargin{1};
    y = varargin{2};
    method = varargin{3};
    l = length(x);
h = abs(x(1) - x(l))/ (length(x)-1);



elseif length(varargin) == 4
    method = "rec";
    f = varargin{1};
    a = varargin{2};
    b = varargin{3};
    n = varargin{4};
h = (b - a)/n;
x = a:h:b;
y = f(x);
else 
    method = varargin{5};
    f = varargin{1};
    a = varargin{2};
    b = varargin{3};
    n = varargin{4};
h = (b - a)/n;
x = a:h:b;
y = f(x);
end



if strcmp(method, "rec")
%Rectangle method
I = h * sum(y);

elseif strcmp(method, "trap")
%Trapezoidal Method
I = nan;
else %Error capture point
    I = nan;
end


end