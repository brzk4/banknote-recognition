function [ y ] = SkalowanieJasnosci( x )

x_max=max(max(x));
y=x./x_max;

end

