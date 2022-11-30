clear 
clc
%Evaluate K1, K2 and K3 using the least square method, and hence determine the
%length of the other links 
%step1 : define the angles
theta2 = 40:5:60;
theta4 = [70,76,83,91,100];
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
     cosTheta2 =cosTheta2 +cosd(theta2(i));
     cosTheta2squared =cosTheta2squared + (cosd(theta2(i)))^2;
     cosTheta2cosTheta4 = cosTheta2cosTheta4 + (cosd(theta2(i))*cosd(theta4(i)));
     cosTheta4 = cosTheta4 + cosd(theta4(i));
     cosTheta4squared = cosTheta4squared + (cosd(theta4(i))^2);
     m = m + cosd(theta4(i))*cosd(theta2(i)-theta4(i));
     n = n + cosd(theta2(i))*cosd(theta2(i)-theta4(i));
     p = p + cosd(theta2(i)-theta4(i));
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
 d = 180;
 %lengths of link a,b and c
 a =d/K1;
 c = d/K2;
 b =sqrt(a^2 +c^2 +d^2 -(2*a*c*K3));
 disp(a);
 disp(b);
 disp(c);
 %calculating the transmission angles for the given range of input angles
 %and plotting the graph of transmission angles against input angles
 inputangles = 40:1:60;
 cosines = (b^2 +c^2 -a^2 -d^2 + (2*a*d).*cosd(inputangles))/(2*b*c);
 transmissionangles = acosd(cosines);
 plot(inputangles,transmissionangles,'g-');
 grid on;
 
 %output angles
 outputangles = 70:1:90;
 

 
 
 
 
 
 
     
     

