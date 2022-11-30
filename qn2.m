clear
clc
%solving the first equation
syms  t y(t) f
y(t) = dsolve('D2y + 2*Dy +15*y=0','y(0)=1','Dy(0)=0');
y(t)
fplot(y(t));
axis([-6 6 -400 400]);
grid on;

%solving for Wn and zeta
Wn = sqrt(15);
disp(['Wn: ',num2str(Wn)]);
zeta =2/(2*Wn);
disp(['Zeta :',num2str(zeta)]);

%Hold Wn constant, vary zeta from 0.1 to 1.2 and plot on
%the same graph the resulting function. 
zeta =linspace(0.1,1.2,12);
%let coefficient of Dy  be b
b = (2*Wn).*zeta;
figure
y(t) = dsolve('D2y + (2*sqrt(15))*0.1*Dy + 15*y=0','y(0)=1','Dy(0)=0');
fplot(y(t));
legend(['z =',num2str(0.1)]);
grid on;
hold on;
y(t) = dsolve('D2y + (2*sqrt(15))*0.2*Dy + 15*y=0','y(0)=1','Dy(0)=0');
fplot(y(t));
legend(['z =',num2str(0.2)]);
grid on;
hold on;
y(t) = dsolve('D2y + (2*sqrt(15))*0.3*Dy + 15*y=0','y(0)=1','Dy(0)=0');
fplot(y(t));
legend(['z =',num2str(0.3)]);
grid on;
hold on;
y(t) = dsolve('D2y + (2*sqrt(15))*0.4*Dy + 15*y=0','y(0)=1','Dy(0)=0');
fplot(y(t));
legend(['z =',num2str(0.4)]);
grid on;
hold on;
y(t) = dsolve('D2y + (2*sqrt(15))*0.5*Dy + 15*y=0','y(0)=1','Dy(0)=0');
fplot(y(t));
legend(['z =',num2str(0.5)]);
grid on;
hold on;
y(t) = dsolve('D2y + (2*sqrt(15))*0.6*Dy + 15*y=0','y(0)=1','Dy(0)=0');
fplot(y(t));
legend(['z =',num2str(0.6)]);
grid on;
hold on;





