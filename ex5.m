% Define the function
f = @(x1, x2, a, b) 1/4 * ((x1 - a(1)).^2 + (x2 - b(1)).^2 + (x1 - a(2)).^2 + (x2 - b(2)).^2) + (x1 - a(3)).^2 + (x2 - b(3)).^2 + (x1 - a(4)).^2 + (x2 - b(4)).^2;

% Create a grid of points
[x1, x2] = meshgrid(linspace(-5, 5, 50), linspace(-5, 5, 50));

% Gradient Descent parameters
learning_rate = 0.1;
iterations = 50;

% Parameters for the function
a = [1; 2; 3; 4];
b = [2; -1; 3; 0];

% Initial point
x = [-5; -3];
% Initialize points matrix
points = zeros(2, iterations + 1);
points(:, 1) = x;

% Stochastic Gradient Descent
for i = 1:iterations
    % Choose a random index
    idx = randi(4);
    
    % Compute stochastic gradient
    gradient = [0.5 * (x(1) - a(idx)); 0.5 * (x(2) - b(idx))];
    
    % Update x
    x = x - learning_rate * gradient;
    
    % Save the point
    points(:, i + 1) = x;
    fprintf('%f\n', x)
end
