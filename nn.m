
function [H_3,H_2]=nn(W_1,B_1,W_2,B_2,X)
Z_2=W_1*X + B_1;
H_2= sigmf(Z_2,[1 0]);%sigmf(Z_2,[1 0]);
Z_3=W_2*H_2 + B_2;
H_3= sigmf(Z_3, [1 0]);%sigmf(Z_3, [1 0]);
end
