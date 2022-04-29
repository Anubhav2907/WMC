clc
clear all
close all
Tau0 =0;
f=1;
nop =4;
beta = rand(1,nop);
Tauj = [0.62 1.84 0.86 0.37]; BETA = [0.23 0.17 0.23 0.44]; rxsignal =[];
tvtf = [];
t = 0:(1/100):99.99; txsignal = cos(2*pi*f*t); z=1;
for t =0:(1/100):99.99
temp =0; temp1 =0; for p=1:1:nop
U19EC112 AASHISH CHACHAN
 temp = temp+BETA(p)*exp(2*pi*f*t)*exp(-1i*2*pi*f*Tau0)*exp(- 1i*2*pi*f*Tauj(p)*t);
temp1 = temp1+BETA(p)*exp(-1i*2*pi*f*Tau0)*exp(- 1i*2*pi*f*Tauj(p)*t);
end
rxsignal = [rxsignal temp]; tvtf = [tvtf temp1];
end
figure(1)
subplot(2,2,1) plot(txsignal)
axis([1 1000 -2 2]); title('Transmitted signal');
subplot(2,2,2)
fre = (0:1:length(rxsignal)-1)/100; plot(real(rxsignal),'r')
axis([1 1000 -2 2]);
title('Real part of received signal');
subplot(2,2,3)
plot(fre, abs(fft(txsignal)));
axis([0 2 0 1000]);
title('Spectrum of transfer signal');
subplot(2,2,4)
plot(fre, abs(fft(real(rxsignal))));
title('real part of corresponding spectrum of transmitted signal');
figure(2)
subplot(2,1,1)
plot(abs(tvtf));
axis([0 1000 0 2]);
title('Time varying transfer function value magnitude');
subplot(2,1,2)
plot(phase(tvtf));
axis([0 1000 -25 0]);
title('Time varying transfer function value phase');