clear
clc
%solving the differential equation
syms y(t) 
eqnone =diff(y,t,2) + 2*diff(y,t) +15*y==0;
Dy =diff(y,t);
cond=[y(0)==1,Dy(0)==0];
ysol1(t)=dsolve(eqnone,cond);
disp(ysol1(t));

%plotting the result
fplot(ysol1(t));
axis([-6 6 -400 400]);
grid on; 

%solving for Wn and zeta
Wn = sqrt(15);
disp(['Wn: ',num2str(Wn)]);
zeta =2/(2*Wn);
disp(['Zeta :',num2str(zeta)]);

%Hold Wn constant, vary zeta from 0.1 to 1.2 and plot on
%the same graph the resulting function. 
zeta2 = 0.1:0.1:1.2;
%let coefficient of Dy  be b
b = (2*Wn).*zeta2;
figure
%solve and plot the function for zeta = 0.1  -  1.2
%syms y(t)
for i= 1:length(b)
    eqn = diff(y,t,2) + b(i)*diff(y,t) + 15*y ==0;
   % Dy =diff(y,t);
   % cond=[y(0)==1,Dy(0)==0];
    ysol(t) =dsolve(eqn,cond);
    fplot(ysol(t));
    axis([-6 6 -1000 1000]);
    legend(['z =',num2str(zeta2(i))]);
    hold on;
    grid on;
end

%change wn so that it is above or below the original value
figure
wn1 = 2;
wn2 = 4.2;
%wn =2
eqn = diff(y,t,2) + 2*zeta*wn1*diff(y,t) +(wn1^2)*y ==0;
%Dy=diff(y,t);
%cond=[y(0)==1,Dy(0)==0];
ysol(t)=dsolve(eqn,cond);
fplot(ysol(t));
legend(['Wn = ',num2str(wn1)]);
hold on;
grid on;
%wn =sqrt(15);
fplot(ysol1(t));
legend(['Wn = ',num2str(Wn)]);
hold on;

%wn = 4.2
eqn = diff(y,t,2) + 2*zeta*wn2*diff(y,t) +(wn2^2)*y ==0;
%Dy=diff(y,t);
%cond=[y(0)==1,Dy(0)==0];
ysol(t)=dsolve(eqn,cond);
fplot(ysol(t));
legend(['Wn =',num2str(wn2)]);




    

