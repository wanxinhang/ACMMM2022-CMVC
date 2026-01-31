clear
clc
warning off;
clear
clc
warning off;
lamda=1;
path = './';
addpath(genpath(path));
dataName = '3Sources_3view'; 
load(['F:\work2015\datasets\',dataName ,'_Kmatrix'],'Y');
load(['F:\mydata\',dataName,'_Ht','.mat'],'Ht');
numclass = length(unique(Y));
numker = size(Ht,2);
num = size(Ht{1},1);
qnorm = 2;
lambda = 2.^(-10:1:10);
avg_time=0;
k=numclass;
opt.disp = 0;

best_acc=0;
best_nmi=0;
best_pur=0;
for lam = 1:length(lambda)
    lam
    %     [H_normalized,time1]= xunhuan(Ht,numclass,numker,num,qnorm,lambda(lam));
    [H_normalized,time1]= xunhuan(Ht,numclass,numker,num,qnorm,lambda(lam));
    time_result(lam)=time1;
    avg_time=avg_time+time1;
    res(lam,:) = myNMIACC(H_normalized, Y, numclass);
    if res(lam,1)>best_acc
        best_acc=res(lam,1);
    end
    if res(lam,2)>best_nmi
        best_nmi=res(lam,2);
    end
    if res(lam,3)>best_pur
        best_pur=res(lam,3);
    end
    
end
best_acc
best_nmi
best_pur
best_res(1)=best_acc;
best_res(2)=best_nmi;
best_res(3)=best_pur;
avg_time=avg_time/length(lambda)
save(['F:\collect_data\',dataName ,'_result'],'res','time_result','best_res','avg_time');
