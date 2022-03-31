%% 超调量和相位裕度关系图
clc,clear;close all;
xi=0:0.001:1;MMr=[];kks=[];
for i=1:length(xi)
    gamma(i)=atan(2*xi(i)/sqrt(sqrt(4*xi(i)^4+1)-2*xi(i)^2))*180/pi;
    sigma(i)=exp(-pi*xi(i)/sqrt(1-xi(i)^2))*100/2+10;
    if xi(i)<0.707
        Mr(i)=1/(2*xi(i)*sqrt(1-xi(i)^2));
    else Mr(i)=1;
    end
    if Mr(i)<=7.5
        MMr=[MMr Mr(i)*10-10];
        kks=[kks xi(i)];
    end
end
plot(xi,gamma,'b-',xi,sigma,'r-',kks,MMr,'g-');grid on;
%% 调节时间、截止频率和相位裕度关系图
clc,clear;close all;
xi=0.2:0.01:1;
for i=1:length(xi)
    gamma(i)=atan(2*xi(i)/sqrt(sqrt(4*xi(i)^4+1)-2*xi(i)^2));
    TsWc(i)=7/tan(gamma(i));
end
plot(gamma*180/pi,TsWc,'b-');grid on;