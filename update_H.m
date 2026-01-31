function [H] = update_H(H_last,H_this,Wt,m)
%UPDATE_H 此处显示有关此函数的摘要
%   此处显示详细说明
HHH=H_this*Wt+m*H_last;
[Up,Sp,Vp] = svd(HHH,'econ');
H = Up*Vp';
end

