x = 1:20;

%% (1)
figure(1)
plot(x)
title("图检验")

%% (2)
rho = zeros(1,6);
for k =1:6      %延迟期数k
    x_s = x(1:length(x)-k);
    x_t = x(k+1:length(x));
    
    cov = mean( (x_t - mean(x_t)).*(x_s - mean(x_s)) );
    rho(k) = cov/( var(x_t) * var(x_s) );   %自相关系数
end

%% (3)
figure(2)
plot(rho)
title("自相关图")
xlabel("延迟期数k")
ylabel("自相关系数")