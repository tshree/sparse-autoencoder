Y_1=zeros(1,10);
Y_2=zeros(1,10);
J_2=zeros(size(GradW_J_1,1),size(GradW_J_1,2));
J_1=zeros(size(GradW_J_1,1),size(GradW_J_1,2));
G_W_1=zeros(size(GradW_J_1,1),size(GradW_J_1,2));
gradW_J_1=zeros(size(GradW_J_1,1),size(GradW_J_1,2));
comp_n_y=zeros(1,10);
for k=1:15
    e= zeros(size(W_1,1),size(W_1,2));
    e(k)=1;
    for l=100:100:1000
        Y_2(l/100)=nn(W_1+0.0001*e,B_1,W_2,B_2,u(l));
        Y_1(l/100)=nn(W_1-0.0001*e,B_1,W_2,B_2,u(l));
        comp_n_y(l/100)=n_y(l);
    end
    J_2(k)=0.5*(Y_2-comp_n_y)*(transpose(Y_2-comp_n_y));
    J_1(k)=0.5*(Y_1-comp_n_y)*(transpose(Y_1-comp_n_y));
    
end
for l=100:100:1000
    gradW_J_1(:,:)=gradW_J_1(:,:)+GradW_J_1(:,:,l);
end
G_W_1=(J_2-J_1)/(2*0.0001);

plot(G_W_1 - gradW_J_1/10)
