all_theta = load("trained_theta.data");
load('ex3data1.mat');
indexes = randperm(length(X));
i = indexes(60);
aux = zeros(size(all_theta,1),1);
%X = imread('test.png');
%X = double(X(:,:,1));
%X
%temp = X;
%X = (X.-128)./255;
%X = X.* (temp>0);
%X = reshape(X,[], numel(X));
%displayData(X);
for j = 1:size(all_theta,1)
  aux(j) = sigmoid(all_theta(j,:)*[1, X(i,:)]');
  %aux(j) = sigmoid(all_theta(j,:)*[1, X]');
endfor
[maxi, index_max] = max(aux);
displayData(X(i,:));
if(index_max == 10)
  disp(0);
else
  disp(index_max);
endif