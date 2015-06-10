%% Przygotowanie banknotow i wzorcow
banknot_we = imread('banknot_10.jpg');

wzor_10 = imread('wzor_10.jpg');
wzor_20 = imread('wzor_20.jpg');
wzor_50 = imread('wzor_50.jpg');
wzor_100 = imread('wzor_100.jpg');
wzor_200 = imread('wzor_200.jpg');

[banknot_we_R,banknot_we_G,banknot_we_B]=Przygotuj(banknot_we);
[wzor_10_R,wzor_10_G,wzor_10_B]=Przygotuj(wzor_10);
[wzor_20_R,wzor_20_G,wzor_20_B]=Przygotuj(wzor_20);
[wzor_50_R,wzor_50_G,wzor_50_B]=Przygotuj(wzor_50);
[wzor_100_R,wzor_100_G,wzor_100_B]=Przygotuj(wzor_100);
[wzor_200_R,wzor_200_G,wzor_200_B]=Przygotuj(wzor_200);

subplot 211
imagesc(banknot_we_R);

subplot 212
imagesc(wzor_10_R);
%% Odejmowanie wzorca 10 od banknotu w masce czerwonej
[n,m]=size(banknot_we_R);
[n1,m1]=size(wzor_10_R);
out=zeros(n,m);
for i=1:abs(m1-m)
    for k=1:abs(n1-n)
        z=zeros(n,m);
        z(k:k+n1-1,i:i+m1-1)=wzor_10_R;
        out(k:k+n1-1,i:i+m1-1)=banknot_we_R(k:k+n1-1,i:i+m1-1)-z(k:k+n1-1,i:i+m1-1);
    end
end

%surf(out);