function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

cant_pos = 0;
cant_neg = 0;

for i = 1:size(y,1)
  if (y(i)==1)
    cant_pos = cant_pos + 1;
  else
    cant_neg = cant_neg + 1;
  endif
endfor

pos = zeros(cant_pos,2);
neg = zeros(cant_neg,2);
p=1;
n=1;
for i = 1:size(y,1)
  if (y(i)==1)
    pos(p,1)=X(i,1);
    pos(p,2)=X(i,2);
    p = p+1;
  else
    neg(n,1)=X(i,1);
    neg(n,2)=X(i,2);
    n = n+1;
  endif
endfor

plot(pos(:,1),pos(:,2), 'k+','LineWidth', 2,'MarkerSize', 7);1
plot(neg(:,1),neg(:,2), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);

% =========================================================================



hold off;

end
