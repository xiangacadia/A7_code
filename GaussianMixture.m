clear;
load('./data1.mat')

y = data(:,5)>.5;
phi1=0.5;  phi2=0.5;
x = data(:,1:4);

%visualization
data1 = x(y,:);
data2 = x(~y, :);
a=2;
b=3;
%plot(data1(:,a),data1(:,b), 'r*');
%hold on;
%plot(data2(:,a), data2(:,b), 'g+');




index = rand(1,100)>0.5;
%x = x(:,3);
x1 = data(index,:); x2 = data(~index,:);

mu1 = mean(data1) + rand(1,4);
mu2 = mean(data2) + rand(1, 4);
%mu1= mean(x1);  mu2= mean(x2);
cov1 = cov(data1);
cov2 = cov(data1)+4;

% p = [0.1, 0.2, 0.4, 0.3];
% R1 = mnrnd(10, p, 4)
% cov1 = abs(cov(R1))
% mu1 = mean(R1)
% 
% p = [0.3, 0.1, 0.1, 0.5];
% R2 = mnrnd(10, p, 4);
% cov2 = abs(cov(R2))
% mu2 = mean(R2)


for i=1:100
    clf; hold on;
   % expectation
   P1 = mvnpdf(x, mu1, cov1) .* phi1;
   P2 = mvnpdf(x, mu2, cov2) .* phi2;
   label = P1 > P2;
   % maximization
   x1 = x(label,:);
   x2 = x(~label, :);
   mu1 = mean(x1);
   mu2 = mean(x2);
   cov1 = cov(x1);
   cov2 = cov(x2);
   ph1 = mean(label);
   ph2 = 1-ph1;
   mean(label == data(:,5))  
   
   
%    plot(x1(:,a),x1(:,b), 'r*');
% hold on;
% plot(x2(:,a), x2(:,b), 'g+');
   
  % waitforbuttonpress;
end
P1 = mvnpdf(x, mu1, cov1) .* phi1;
P2 = mvnpdf(x, mu2, cov2) .* phi2;
label = P1 > P2;
mean(label == data(:,5))   
   
