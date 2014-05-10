h_3=zeros(1,1,1000);   %derivative of f of 3rd layer
h_2=zeros(15,1,1000);
%d_3=zeros(size(H_3,1),size(H_3,2),1000);
W_d_2 = zeros(size(W_2,1),size(W_2,2));
W_d_1 = zeros(size(W_1,1),size(W_1,2));

B_d_2 = zeros(size(B_2,1),size(B_2,2));
B_d_1 = zeros(size(B_1,1),size(B_1,2));

H_3 = zeros(1,1,1000);
H_2 = zeros(15,1,1000);
d_3 = zeros(1,1,1000);
d_2 = zeros(15,1,1000);
GradW_J_1 = zeros(15,1,1000);
GradW_J_2 = zeros(1,15,1000);
GradB_J_1 = zeros(15,1,1000);
GradB_J_2 = zeros(1,1,1000);

for j = 1:2000
for i=1:1000
    
[H_3(:,:,i),H_2(:,:,i)] = nn(W_1,B_1,W_2,B_2,u(i));

h_3(:,:,i)=H_3(:,:,i).*(1-H_3(:,:,i));
h_2(:,:,i)=H_2(:,:,i).*(1-H_2(:,:,i));
d_3(:,:,i) = -(y(i)-H_3(:,:,i)).*h_3(:,:,i);
d_2(:,:,i) = (transpose(W_2)*d_3(:,:,i)).*h_2(:,:,i);
GradW_J_1(:,:,i) = d_2(:,:,i)*(transpose(u(i)));
GradW_J_2 (:,:,i)= d_3(:,:,i)*(transpose(H_2(:,:,i)));

GradB_J_1(:,:,i) = d_2(:,:,i);
GradB_J_2(:,:,i) = d_3(:,:,i);

W_d_2 = W_d_2 +GradW_J_2(:,:,i);
W_d_1 = W_d_1 +GradW_J_1(:,:,i);
B_d_2 = B_d_2 +GradB_J_2(:,:,i);
B_d_1 = B_d_1 +GradB_J_1(:,:,i);

end

W_2 = W_2 - 0.3*((W_d_2/1000)+0.0*W_2);
W_1 = W_1 - 0.3*((W_d_1/1000)+0.0*W_1);
B_2 = B_2 -0.3*B_d_2/1000;
B_1 = B_1 -0.3*B_d_1/1000;

end

W_2_final  = W_2;
W_1_final = W_1;
B_1_final = B_1;
B_2_final = B_2;
