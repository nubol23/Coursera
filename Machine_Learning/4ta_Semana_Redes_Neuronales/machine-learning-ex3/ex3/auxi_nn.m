load('ex3weights.mat');
X = imread('test.png');
X = double(X(:,:,1));
temp = X;
X = (X.-128)./255;
X = X.* (temp>0);
X = reshape(X,[], numel(X));
displayData(X);
pred = predict(Theta1, Theta2, X);
disp(mod(pred,10));