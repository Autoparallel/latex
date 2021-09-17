%Colin Roberts
%Math 560
%Cats, Dogs, and the SVD.


% Store these 64x64 pix Cat & Dog pictures in vectors inside C & D
load datamatrix %load our data
C = Y(:,1:99);
D = Y(:,100:end);


% Problem 1
%Calculate the left singular Cat vectors
[U_cat,S_cat,V_cat] = svd(C);
%Display the first singular Cat vector
imagesc(reshape(U_cat(:,1),64,64))

%Calculate the left singular Dog vectors
[U_dog,S_dog,V_dog]=svd(D);
%Display the first singular Dog vector
imagesc(reshape(U_dog(:,1),64,64))


% Problem 2
%Create a w_cat vector and w_perp_cat
w_cat = zeros(4096,1);
w_perp_cat = zeros(4096,1);
%Make a for loop to calculate each component of the w_cat vector
for i=1:99
    w_cat(:,1) = dot(C(:,1),U_dog(:,i))*U_dog(:,i)+w_cat(:,1);
end
%Plot w_cat
imagesc(reshape(w_cat(:,1),64,64))
%calculate w_perp_cat by w_perp_cat = C(:,1)-w_cat
w_perp_cat = C(:,1) - w_cat;
%Plot w_perp_cat
imagesc(reshape(w_perp_cat(:,1),64,64))


% Problem 3
%Create a w_dog vector and w_dog_perp
w_dog = zeros(4096,1);
w_perp_dog = zeros(4096,1);
%Make a for loop to calculate each component of the w_dog vector
for i=1:99
    w_dog(:,1) = dot(D(:,1),U_cat(:,i))*U_cat(:,i)+w_dog(:,1);
end
%Plot w_dog
imagesc(reshape(w_dog(:,1),64,64))
%calculate w_perp_dog by w_perp_dog = D(:,1)-w_dog
w_perp_dog = D(:,1) - w_dog;
%Plot w_perp_dog
imagesc(reshape(w_perp_dog(:,1),64,64))


% Problem 4
%Create a matrix of values for the ||Tu||_2^2 for varying k
Tu_norm_vec = zeros(99,1);
inprod_k = 0;
norm_Tu_square = 0;
norm_u_square=dot(C(:,1),C(:,1));
for k=1:99
    inprod_k = dot(C(:,1),U_cat(:,k));
    norm_Tu_square = inprod_k^2+norm_Tu_square;
    Tu_norm_vec(k,1)=norm_Tu_square;
end
%Make a vector of values all ||u||^2 to compare to ||Tu||^2
norm_u_vec = zeros(99,1);
for k=1:99
    norm_u_vec(k,1) = norm_u_square;
end
%And make a vector for "x" values
x=zeros(99,1);
for k=1:99
    x(k,1) = k;
end
%Now plot the square roots of what I found before!
plot(x,sqrt(Tu_norm_vec(:,1)),x,sqrt(norm_u_vec))


% Problem 5
%Compute CC^T
mat_C = C*transpose(C);
%Find eigenvalues and vectors of CC^T
[V_c,D_c] = eig(mat_C);
%Display the eigenvector with largest eigenvalue
imagesc(reshape(V_c(:,4096),64,64))
%What is the largest eigenvalue?
largest_eval = D_c(4096,4096)
%Compare to the largest singular value
largest_singval = S_cat(1,1)
%Square this
largest_singval_square = largest_singval^2


