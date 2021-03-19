%% 纯随机性检验
close all
clear all
load Data_EquityIdx              %纳斯达克综合指数
len = 120;                       %样本数
Xt = DataTable.NYSE(1:len);

t = 100;                             %t时刻后
Xs = DataTable.NYSE(1+t:len+t);

X = randn(1,300);   %白噪声序列
X1 = X(1:200);
X2 = X(101:300);
covX1 = sum( (X1 - mean(X1)).*(X1- mean(X1)) )/(length(X1) - 1) ;
covX = sum( (X1 - mean(X1)).*(X2- mean(X2)) )/(length(X2) - 1) ;

%% 检验统计量
syms x sigma miu
f(x,miu,sigma) = 1/sqrt(2 * pi *sigma)*exp( -(x-miu).^2/2*sigma.^2 );  % 正态分布函数
miu = 0;
sigma = 1/length(X);

% Q统计量
n = length(X);
for k = 1:n
    rho_hat(k) = f(X(k),miu,sigma).^2;
end
Q = length(rho_hat)*sum(rho_hat);

% LB统计量
n = length(X);
for k =1:n
    rho_hat(k) = f(X(k),miu,sigma).^2 / (n-k);
end
LB = n*(n+2)*sum(rho_hat);