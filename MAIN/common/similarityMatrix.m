function y = similarityMatrix(reducedDataCuben,n)
A = zeros(n,n); 
for i = 1:n
    for j = 1:n
        A(i,j) = mse(reducedDataCuben(:,:,i),reducedDataCuben(:,:,j));
    end
end
y = ones(n,n) - A;
%y = A;
end