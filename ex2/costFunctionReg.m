function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

i=X*theta;
h = sigmoid(i);
x_tran=X';
theta_without_first=theta(2:length(theta));
J = (1/m*(-y'*log(h)-(1-y)'*log(1-h)))+(lambda/(2*m)*sum(theta_without_first.^2));
grad(1)=1/m*x_tran(1,:)*(h-y);
grad(2:size(theta,1)) = (x_tran(2:size(x_tran,1),:)*(h-y)+lambda*theta(2:size(theta,1),:))/m;



% =============================================================

end
