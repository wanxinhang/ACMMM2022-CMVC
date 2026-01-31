% function [H,time] = xunhuan(Ht,numclass,numker,num,qnorm,lambda)
function [H,time] = xunhuan(Ht,numclass,numker,num,qnorm,lambda)
%XUNHUAN 此处显示有关此函数的摘要
%   此处显示详细说明
% numker = size(KH,3);
% num = size(KH,1);
k=numclass;
maxIter = 100;

% for p =1:numker%初始化H_p,M_p
%     KAp = KH(:,:,p);
%     KAp = (KAp+KAp')/2;
%     [tmp_Ht, ~] = eigs(KAp, k, 'la', opt);
%     Ht{p} = tmp_Ht;
%     clear tmp_Ht,KAp;
% end
time=0;
HH=0;
xishu=1;
for p =1:numker
    if p==1
        H=Ht{p};
        HH=HH+Ht{p};
    else
        tic;
        [tmp_H]=each_iter(HH/(p-1),Ht{p},num,numclass,p,lambda);
        toc;
        HH=tmp_H+HH;
%         HH=tmp_H/lambda+HH;
%         xishu=1/lambda+xishu;
       
        
        time=time+toc;
    end
end
time=time/(numker-1);
H=HH/xishu;
H = H./ repmat(sqrt(sum(H.^2, 2)), 1,k);
end

