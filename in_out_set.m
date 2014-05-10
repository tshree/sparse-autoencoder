u=zeros(1,1000);

for t=0:1:999
    u(t+1)=abs(sin(0.1*t));
end
y= zeros(1,1000); % initialisation of y
for t=1:999
    y(t+1)=y(t)/(1+y(t)^2)+u(t)^3;
end
max_y = max(y);
n_y =y/max(y);   % normalisation(value of y varies from 0 to inf.)
%plot(u,n_y);
