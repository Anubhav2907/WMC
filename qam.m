clc;
clear all;
close all;
a = imread('cameraman.tif');
M = input('Enter modulation order : '); m = log2(M);
X = de2bi(a);
X1 = X(:);
zer_pad = rem(length(X1),m); if(zer_pad~=0)
X1 = [X1;zeros(m-zer_pad , 1)];
end
Input = reshape(X1 , length(X1)/m , m); INPUT = bi2de(Input);
y = qammod(INPUT , M ,0 ); scatterplot(y);
z = qamdemod(y,M,0); z1 = de2bi(z,m); if(zer_pad ~= 0)
z1 = z1(1:end-(m-zer_pad));
end
Z = reshape(uint8(z1) , size(X)); I = bi2de(Z);
OUTPUT = reshape(I , size(a)); figure(2);
subplot(1,2,1);
imshow(a);
title('Input Image');
subplot(1,2,2);
imshow(OUTPUT);
title('Demodulated Image');