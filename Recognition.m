%% Przygotowanie banknotow i wzorcow
banknot_we = imread('banknot_200_3.jpg');
[m,n] = size(banknot_we);

wzor_10  = imread('banknot_10.jpg' );
wzor_20  = imread('banknot_20.jpg' );
wzor_50  = imread('banknot_50.jpg' );
wzor_100 = imread('banknot_100.jpg');
wzor_200 = imread('banknot_200.jpg');
 
wzor_10  = imresize(wzor_10 ,[m,n/3]);
wzor_20  = imresize(wzor_20 ,[m,n/3]);
wzor_50  = imresize(wzor_50 ,[m,n/3]);
wzor_100 = imresize(wzor_100,[m,n/3]);
wzor_200 = imresize(wzor_200,[m,n/3]);


[banknot_we_R,banknot_we_G,banknot_we_B]=Przygotuj(banknot_we);
[wzor_10_R,wzor_10_G,wzor_10_B]=Przygotuj(wzor_10);
[wzor_20_R,wzor_20_G,wzor_20_B]=Przygotuj(wzor_20);
[wzor_50_R,wzor_50_G,wzor_50_B]=Przygotuj(wzor_50);
[wzor_100_R,wzor_100_G,wzor_100_B]=Przygotuj(wzor_100);
[wzor_200_R,wzor_200_G,wzor_200_B]=Przygotuj(wzor_200);
 

%% Odejmowanie wzorca 10 od banknotu w maskach RGB
outR=zeros(m,n/3);
outG=zeros(m,n/3);
outB=zeros(m,n/3);

 

for i=1:m
    for k=1:(n/3)
        outR(i,k) = banknot_we_R(i,k) - wzor_10_R(i,k);
        outG(i,k) = banknot_we_G(i,k) - wzor_10_G(i,k);
        outB(i,k) = banknot_we_B(i,k) - wzor_10_B(i,k);
    end
end

out = sqrt( outR.^2 + outG.^2 + outB.^2);
 out1=out;
imagesc(out1);
val_10 = mean(mean(out));

%% Odejmowanie wzorca 20 od banknotu w maskach RGB
outR=zeros(m,n/3);
outG=zeros(m,n/3);
outB=zeros(m,n/3);
for i=1:m
    for k=1:(n/3)
        outR(i,k) = banknot_we_R(i,k) - wzor_20_R(i,k);
        outG(i,k) = banknot_we_G(i,k) - wzor_20_G(i,k);
        outB(i,k) = banknot_we_B(i,k) - wzor_20_B(i,k);
    end
end

out = sqrt( outR.^2 + outG.^2 + outB.^2);

val_20 = mean(mean(out));
 

%% Odejmowanie wzorca 50 od banknotu w maskach RGB
outR=zeros(m,n/3);
outG=zeros(m,n/3);
outB=zeros(m,n/3);
for i=1:m
    for k=1:(n/3)
        outR(i,k) = banknot_we_R(i,k) - wzor_50_R(i,k);
        outG(i,k) = banknot_we_G(i,k) - wzor_50_G(i,k);
        outB(i,k) = banknot_we_B(i,k) - wzor_50_B(i,k);
    end
end

out = sqrt( outR.^2 + outG.^2 + outB.^2);

val_50 = mean(mean(out));


%% Odejmowanie wzorca 100 od banknotu w maskach RGB
outR=zeros(m,n/3);
outG=zeros(m,n/3);
outB=zeros(m,n/3);
for i=1:m
    for k=1:(n/3)
        outR(i,k) = banknot_we_R(i,k) - wzor_100_R(i,k);
        outG(i,k) = banknot_we_G(i,k) - wzor_100_G(i,k);
        outB(i,k) = banknot_we_B(i,k) - wzor_100_B(i,k);
    end
end

out = sqrt( outR.^2 + outG.^2 + outB.^2);

val_100 = mean(mean(out));

%% Odejmowanie wzorca 200 od banknotu w maskach RGB
outR=zeros(m,n/3);
outG=zeros(m,n/3);
outB=zeros(m,n/3);
for i=1:m
    for k=1:(n/3)
        outR(i,k) = banknot_we_R(i,k) - wzor_200_R(i,k);
        outG(i,k) = banknot_we_G(i,k) - wzor_200_G(i,k);
        outB(i,k) = banknot_we_B(i,k) - wzor_200_B(i,k);
    end
end

out = sqrt( outR.^2 + outG.^2 + outB.^2);

val_200 = mean(mean(out));

%%
% ROZPOZNANIE
[val_10 val_20 val_50 val_100 val_200]
value = min([val_10 val_20 val_50 val_100 val_200]);

if value==val_10
     fprintf('Rozpoznano banknot 10z許n');
elseif value==val_20
     fprintf('Rozpoznano banknot 20z許n');
elseif value==val_50
     fprintf('Rozpoznano banknot 50z許n');
elseif value==val_100
     fprintf('Rozpoznano banknot 100z許n');
elseif value==val_200
     fprintf('Rozpoznano banknot 200z許n');
end
    


