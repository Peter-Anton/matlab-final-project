%%Q1
fs=1000;
t1=linspace(-1,3,fs);
y=exp(-abs(t1)./5);
subplot(2,2,1);
plot(t1,y);
title("exp(-abs(t)./5)")
subplot(2,2,2);
y1=exp(-abs(3*t1)./5);
plot(t1,y1);
title("exp(-abs(3*t)./5)")
subplot(2,2,3);
y2=exp(-abs(t1+2)./5);
plot(t1,y2);
title("exp(-abs(t+2)./5)")
subplot(2,2,4);
y3=exp(-abs(4-2*t1)./5);
plot(t1,y3);
title("exp(-abs(4-2*t)./5)")
%%Q2
%%a
fs=2;
Ts=1/fs;
t2=linspace(-100000,100000,200000*fs);
z=(10^(-3)).*t2;
m=(sin(z)./z).^2;
M=Ts*fftshift(fft(m));
n=length(m);
f=(-n/2:n/2-1)*(fs/n);
w=2*pi*f;
figure(2)
subplot(2,1,1)
plot(w,abs(M));
title("sinc fourier transform")
xlim([-0.004,0.004]);
subplot(2,1,2);
plot(t2,m);
title("sinc only")
%%b
x=2*pi*100000*t2;
r=m.*cos(x);
figure(3);
subplot(1,2,1);
plot(t2,r);
title("r(t)")
subplot(1,2,2);
R=Ts*fftshift(fft(r));
plot(w,abs(R));
title("R(jw)")
%%Q3
T0=pi;
w0=(2*pi)/T0;
e=exp(-t);
n=-20:20;
Dn=1/T0*int(e*exp(-(j*n*w0*t)),t,0,pi);
figure(6)
subplot(1,2,1)
stem(n,abs(Dn));
subplot(1,2,2)
stem(n,angle(Dn));
