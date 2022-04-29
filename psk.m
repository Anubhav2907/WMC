clc;
clear all;
close all;
N = input('Enter the order : '); 
img = imread('cameraman.tif'); 
[m,n] = size(img);
p = reshape(img,[m*n,1]);
p_converted = de2bi(p);
p_converted = reshape(p_converted,[],log2(N)); 
p_converted = bi2de(p_converted);
qpsk= pskmod(single(p_converted),N);
scatterplot(qpsk)
qpsk_demod = pskdemod(qpsk,N); 
qpsk_demod = uint8(qpsk_demod); 
demod= de2bi(qpsk_demod);
demod2= reshape(demod, [],8); 
demod3 = bi2de(demod2);
demod = reshape(demod3,[m,n]); 
figure('name','Demodulated Image') 
imshow(demod)