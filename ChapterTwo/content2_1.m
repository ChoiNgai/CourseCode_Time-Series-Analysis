%% 平稳序列的定义

close all
clear all
load Data_EquityIdx              %纳斯达克综合指数
len = 120;                       %样本数
Xt = DataTable.NYSE(1:len);
% X2 = DataTable.NASDAQ(1:len);

t = 100;                             %t时刻后
Xs = DataTable.NYSE(1+t:len+t);
% Xt2 = DataTable.NASDAQ(1+t:len+t);

%% 自协方差和自相关系数
% 自协方差
covX = sum( (Xt - mean(Xt)).*(Xs- mean(Xs)) )/(length(Xt) - 1) ;

% 自相关系数
DXt = sum( (Xt - mean(Xt)).^2 )/(length(Xt) - 1) ;
DXs = sum( (Xs - mean(Xs)).^2 )/(length(Xs) - 1) ;
gama_ts = sum( (Xt -mean(Xt) ).*(Xs - mean(Xs) ));
cor = gama_ts/( sqrt( DXt*DXs ) );




