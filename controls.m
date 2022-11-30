clc
%solving the differential equation
syms y(t) 
eq =diff(y,t,2) + 2*diff(y,t) +15*y==0;
Dy =diff(y,t);
cond=[y(0)==1,Dy(0)==0];
ysola(t)=dsolve(eq,cond);
disp(ysola(t));

%plotting the result
fplot(ysola(t));
hold on;

%solving for Wn and zeta
Wn = sqrt(15);
disp(['Wn: ',num2str(Wn)]);
z1 =1/Wn;
disp(['Zeta :',num2str(z1)]);

% z 0.1-1.2 . 
z = 0.1:0.1:1.2;
figure
%solve and plot the function for zeta = 0.1  -  1.2
syms y(t)
for i= 1:length(z)
    eq = diff(y,t,2) + 2*Wn*z(i)*diff(y,t) + 15*y ==0;
    Dy =diff(y,t);
    cond=[y(0)==1,Dy(0)==0];
    ysol(t) =dsolve(eq,cond);
    fplot(ysol(t));
    axis([-20 20 -1000 1000]);
    legend(['z =',num2str(z(i))]);
    hold on;
end


%vary Wn 
figure
wn1 = 1;
wn2 = 6;
%wn >wn
eqn = diff(y,t,2) + 2*z1*wn1*diff(y,t) +(wn1^2)*y ==0;
Dy=diff(y,t);
cond=[y(0)==1,Dy(0)==0];
ysol(t)=dsolve(eqn,cond);
fplot(ysol(t));
hold on;
%wn =sqrt(15);
fplot(ysola(t));
hold on;
%wn <Wn
eqn = diff(y,t,2) + 2*z1*wn2*diff(y,t) +(wn2^2)*y ==0;
Dy=diff(y,t);
cond=[y(0)==1,Dy(0)==0];
ysol(t)=dsolve(eqn,cond);
fplot(ysol(t));
legend("djf;fejf;oiejf");


