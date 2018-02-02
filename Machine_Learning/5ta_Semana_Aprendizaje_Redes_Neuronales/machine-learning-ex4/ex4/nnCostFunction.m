function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
#Theta1 = 25x401
                #X = 5000x400
#Theta2 = 10x26
X = [ones(size(X,1),1), X];
#X = 5000x401

Y = eye(num_labels)(y,:); #(5000x10) Ponemos valores 1 en la columna y(i) de la iesima columna
                          #por ejemplo si el resultado en la fila 5 era caracter 2, entonces
                          #entonces la columna 2 de la fila 5 valdra 1 y todas las demas 0

a_2 = sigmoid(X*Theta1'); #(5000x401)x(401x25)=(5000x25)

a_2 = [ones(m,1), a_2]; #(5000x26)


a_3 = sigmoid(a_2*Theta2'); #(5000x26)x(26x10)=(5000x10)



J = -(1/m) * sum( sum (( Y .* log(a_3) + (1 .- Y) .* log(1-a_3) ),2) ) + ...
(lambda/(2*m)) * ( sum( sum( Theta1(:,2:end).^2, 2) ) + sum( sum( Theta2(:,2:end).^2, 2) ) );

% ==============================Back Propagation===========================

%Theta2_grad = Y .- a_3;  #(5000x10)

%Theta1_grad = Theta2_grad * Theta2(:,2:end);  #(5000x10)x(10x25)=(5000x25)

%Theta2_grad = Theta2_grad'; #(10x5000)
%Theta1_grad = Theta1_grad'; #(25x5000)

%Theta1_grad = Theta1_grad .* sigmoidGradient((X*Theta1')'); #(25x5000)

#Delta2 = 0;
#Delta1 = 0;
#for i = 1:m
#  Delta2 += (Theta2_grad(:,i) * a_2(i,:)); #(10x1)x(1x26)
#  Delta1 += (Theta1_grad(:,i) * X(i,:)); #(25x1)x(25x401)
#endfor

#Theta1_grad = (1/m) * Delta1;
#Theta2_grad = (1/m) * Delta2;

%Theta1_grad = (1/m) * (Theta1_grad*X);    #(25x500)x(5000x401)
%Theta2_grad = (1/m) * (Theta2_grad*a_2);  #(10x5000)x(5000x26)=(10x26)


% -------------------------------------------------------------
#Theta1 = 25x401
#Theta2 = 10x26
#X = 5000x401

for t = 1:m
  z_2 = Theta1 * X(t,:)';
  a_2 = [1; sigmoid(z_2)];
  a_3 = sigmoid(Theta2 * a_2);
  
  d_3 = a_3 .- Y(t,:)';
  d_2 = Theta2(:,2:end)' * d_3 .* sigmoidGradient(z_2);
  
  Theta2_grad += (1/m) * (d_3 * a_2');
  Theta1_grad += (1/m) * (d_2 * X(t,:));
endfor

Theta2_grad(:,2:end) += ((lambda/m) * Theta2(:,2:end));
Theta1_grad(:,2:end) += ((lambda/m) * Theta1(:,2:end));

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end

#Mi version, modo vertical
#a_2 = sigmoid(Theta1*X'); #25x5000
#a_2 = [ones(1,m); a_2]; #26x5000
#a_3 = sigmoid(Theta2*a_2); #10x5000
#J = -(1/m) * sum( sum ( Y' .* log(a_3) + (1 .- Y') .* log(1-a_3) ) );