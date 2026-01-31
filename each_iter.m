function [HH] = each_iter(H_last,H_this,num,numclass,t,lamda)
%ITER 此处显示有关此函数的摘要
%   此处显示详细说明
m=lamda;
maxIter = 100;
Wt=eye(numclass);
flag = 1;
iter = 0;
while flag
    iter=iter+1;
    H_next=update_H(H_last,H_this,Wt,m);
    Wt=update_Wt(H_next,H_this);
%     Wt_=update_Wt_(H_last,H_next);
    tmpp=trace(H_next'*(H_this*Wt+m*H_last));
%     tmpp
    obj(iter) = tmpp;
    if (iter>2) && (abs((obj(iter)-obj(iter-1))/(obj(iter)))<1e-6 || iter>maxIter)
        flag =0;
    end
end
HH=H_this*Wt;
end
