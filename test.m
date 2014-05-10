% Test
out_Y = zeros(1,1000);
for i = 1:1000
    out_Y(i) = nn(W_1_final,B_1_final,W_2_final,B_2_final,u(i));
end
%hold on
plot(out_Y);
