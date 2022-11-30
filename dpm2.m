%Enter theta 2
theta = input('Enter theta: ');
theta4 = 70-(18000/theta);
k1 = 1.5408;
k2 = -1.9260;
k3= -0.2622;
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
value1=ans1;
value2=ans2;
disp(["Generated1: ",value1]);
%disp(["Generated2: ",value2]);
disp(["Error:",theta4-value1]);




