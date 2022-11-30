%Enter theta 2
theta = input('Enter theta: ');
theta4 = 245+0.35*theta;
k1 = -9.4152;
k2 = 3.8919;
k3= 0.1334;
a = (1-k2)*cosd(theta) -k1 +k3;
b =-2*sind(theta);
c = k1-(1+k2)*cosd(theta) + k3;
x =sqrt(b*b -4*a*c);
%positive root
y =(-b+x)/(2*a);
%negative root
z = (-b-x)/(2*a);

ans1 = 2*atand(y);
ans2 =2*atand(z);
%disp(ans1);
disp(["Required: ",theta4]);
value=(360+ans2);
disp(["Generated: ",value]);
disp(["Error:",theta4-value]);




