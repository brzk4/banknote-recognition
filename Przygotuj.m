function [ y_R,y_G,y_B ] = Przygotuj( x )
%Przygotuj - przygotowuje banknot 
%   
[y_R,y_G,y_B]=PodzialNaMaski(x);

y_R=OdejmijSrednia(y_R);
y_G=OdejmijSrednia(y_G);
y_B=OdejmijSrednia(y_B);

y_R=SkalowanieJasnosci(y_R);
y_G=SkalowanieJasnosci(y_G);
y_B=SkalowanieJasnosci(y_B);

end

