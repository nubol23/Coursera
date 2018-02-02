data = load('ex1data1.txt');
X = data(:,1);
y = data(:,2);
theta = zeros(2,1);
%function h = H(x,theta)
%  h = theta(1)+theta(2)*x
%end
 
 res = 0;
 m = length(y);
 %for i = 1:m
 %  res = res + ( theta(1)+theta(2)*X(i) - y(i) )^2;
 %endfor
 
 %J = (1/(2*m)) * res;
 %disp(J)
 temp_1 = 0;
 temp_2 = 0;
 for iter = 1:1500

    for i = 1:m
      res = res + ( theta(1)+theta(2)*X(i) - y(i) );
    endfor
    temp_1 = theta(1) - alpha * ( (1/m) * res );
    
    res = 0;
    for i = 1:m
      res = res + ( theta(1)+theta(2)*X(i) - y(i)  ) * X(i);
    endfor
    temp_2 = theta(2) - alpha * ( (1/m) * res );
    
    theta(1) = temp_1;
    theta(2) = temp_2;

  end

disp(theta)

for i = 1:m
  line_x(i) = X(i);
  line_y(i) = theta(1) + theta(2)*X(i);
endfor

plot(X,y)
hold on;
plot(line_x,line_y)