clear 
clc
%three precision points using chebyshev's spacing 
ftheta =165;
itheta =15;
theta21 = 0.5*(itheta+ftheta) -0.5*(ftheta-itheta)*cos(pi*(((2*1)-1)/6));
theta22 = 0.5*(itheta+ftheta) -0.5*(ftheta-itheta)*cos(pi*(((2*2)-1)/6));
theta23 =0.5*(itheta+ftheta) -0.5*(ftheta-itheta)*cos(pi*(((2*3)-1)/6));
theta2 =[theta21 theta22 theta23];
%finding theta4
theta4 = 65 + 0.43.*theta2;

%evaluating k1 k2 and k3
%using freudensteins equation and taking the coefficients of k1 k2 and k3
%to form a 3x3 matrix
A =[cosd(theta4(1)) -(cosd(theta2(1))) 1;
   cosd(theta4(2)) -(cosd(theta2(2))) 1;
   cosd(theta4(3)) -(cosd(theta2(3))) 1];
B = [cosd(theta2(1)-theta4(1));
    cosd(theta2(2)-theta4(2));
    cosd(theta2(3)-theta4(3))];
K = A\B;
K1 =K(1);
K2=K(2);
K3 =K(3);
%link lengths a b c 
d = 410;
a =abs(d/K1);
c = abs(d/K2);
b =sqrt(a^2 +c^2 +d^2 -(2*a*c*K3));
%Determine the transmission angles for the input angles 
inputangles = 15:5:165;
cosines = (b^2 + c^2 -a^2 -d^2 + (2*a*d).*cosd(inputangles))/(2*b*c);
transmissionangles = acosd(cosines);
%plotting a graph of transmission angles against input angles
plot(inputangles,transmissionangles,'b-');
grid on;
%link ratios k1 k2 and k3 using method of least squares
theta2list =[15 theta21 theta22 theta23 165];
theta4list = 65 + 0.43.*theta2list;
%elements of matrix A 
N = 5;
cosTheta2 = 0;
cosTheta2squared =0;
cosTheta2cosTheta4 =0;
cosTheta4 =0;
cosTheta4squared =0;
%Elements of matrix B
 m = 0;
 n = 0;
 p = 0;

%computing the sums
 for i= 1:N
     cosTheta2 =cosTheta2 +cosd(theta2list(i));
     cosTheta2squared =cosTheta2squared + (cosd(theta2list(i)))^2;
     cosTheta2cosTheta4 = cosTheta2cosTheta4 + (cosd(theta2list(i))*cosd(theta4list(i)));
     cosTheta4 = cosTheta4 + cosd(theta4list(i));
     cosTheta4squared = cosTheta4squared + (cosd(theta4list(i))^2);
     m = m + cosd(theta4list(i))*cosd(theta2list(i)-theta4list(i));
     n = n + cosd(theta2list(i))*cosd(theta2list(i)-theta4list(i));
     p = p + cosd(theta2list(i)-theta4list(i));
 end

%defining the matrices 
 A  =[cosTheta4squared -cosTheta2cosTheta4 cosTheta4;
     cosTheta2cosTheta4 -cosTheta2squared cosTheta2;
     cosTheta4 -cosTheta2 N];
 B =[m;n;p];
  %finding the values of K1,K2,K3:
 K = A\B;
 K1=K(1);
 K2=K(2);
 K3=K(3);
 %length of the fixed link
 d = 410;
 %lengths of link a,b and c
 a =abs(d/K1);
 c = abs(d/K2);
 b =sqrt(a^2 +c^2 +d^2 -(2*a*c*K3));
 disp(a);
 disp(b);
 disp(c);
 
 
 
 


