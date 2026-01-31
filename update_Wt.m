function [Wt] = update_Wt(H_next,H_this)
%UPDATE_WT 此处显示有关此函数的摘要
%   此处显示详细说明
HHH=H_this'*H_next;
[Up,Sp,Vp] = svd(HHH,'econ');
Wt = Up*Vp';
end

