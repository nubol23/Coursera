#X = imread('Cover.jpg');
X = imread('Sirenia - Perils Of The Deep Blue. Front.jpg');
X = double(X(:,:,1));
temp = X;
X = (X.-128)./255;
X = X .* (temp>0);
X
X = reshape(X,[],numel(X));
size(X)
displayData(X);