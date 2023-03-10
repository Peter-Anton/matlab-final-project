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
fs=1000;
t2=linspace(-10000,10000,fs);
m=sinc((10^-3)*t2).^2;
M=(1/fs)*fftshift(fft(m));
f=fs/2*t2;
w=2*pi*f;
figure(2)
subplot(2,1,1)
plot(w,abs(M));
title("sinc fourier transform")
xlim([-20000000 20000000])
subplot(2,1,2);
plot(t2,m);
title("sinc only")

%%b
fs=10000;
t5=linspace(-10000,10000,fs);
z=(10.^(-3)).*t5;
Sinc=(sin(z)./z).^2;
x=2*pi*100000*t5;
r=Sinc.*cos(x);
n=length(r);
f=(-n/2:n/2-1)*(fs/n);
w=2*pi*f;
figure(3);
subplot(1,2,1);
plot(t5,r);
title("r(t)")
subplot(1,2,2);
R=(1/fs)*fftshift(fft(r));
plot(w,abs(R));
xlim([-200 200])
title("R(jw)")


%%Q3
syms t
w0=(2*pi)/pi;
n=-20:20;
Dn=1/pi*int(exp(-t)*exp(-(j*n*w0*t)),t,0,pi);
figure(6)
subplot(1,2,1)
stem(n,abs(Dn));
subplot(1,2,2)
stem(n,angle(Dn));
