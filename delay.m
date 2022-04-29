clc;
close all;
TAU0=0;
t0=1;
nop=4; BETA=rand(1,nop); TAUJ=(rand(1,nop)*2-1); rxsignal=[]; tv_tf_comp_at_t0=[]; z=1;
t1=1;
for f=0:(1/1000):0.999
temp=0; temp1=0;
for p=1:1:nop
temp1=temp1+BETA(p)*exp(-1i*2*pi*f*TAU0)*exp(- 1i*2*pi*f*TAUJ(p)*t0);
end
tv_tf_comp_at_t0=[tv_tf_comp_at_t0 temp1]; end
figure
plot((0:(1/1000):0.999)*1000,abs(tv_tf_comp_at_t0));
title('Time Varying Transfer Function computed at the time instant... t0=1us');