% Define the function
f = @(x1, x2) max(x1 + x2, max(0.9*x1 - 1.1*x2 + 1, max(-0.8*x1 + 1.2*x2 - 1, 2 - 1.1*x1 - 0.9*x2)));

% Gradient Descent parameters
learning_rate = 0.1;
iterations = 50;

% Initial point
x = [-3; -5];
% Initialize points matrix
points = zeros(2, iterations + 1);
points(:, 1) = x;

% Gradient Descent
for i = 1:iterations
    gradient = compute_gradient(x(1), x(2));
    x = x - learning_rate * gradient;
    points(:, i + 1) = x;
    fprintf('%d\n', x)
end

function gradient = compute_gradient(x1, x2)
    % Initialize gradient
    gradient = zeros(2, 1);
    
    % Thresholds
    threshold1 = max(0.9 * x1 - 1.1 * x2 + 1, max(-0.8 * x1 + 1.2 * x2 - 1, 2 - 1.1 * x1 - 0.9 * x2));
    threshold2 = max(x1 + x2, max(0.9 * x1 - 1.1 * x2 + 1, max(-0.8 * x1 + 1.2 * x2 - 1, 2 - 1.1 * x1 - 0.9 * x2)));
    
    % Compute gradient based on thresholds
    if threshold2 == x1 + x2
        gradient(1) = 1;
        gradient(2) = 1;
    elseif threshold2 == 0.9 * x1 - 1.1 * x2 + 1
        gradient(1) = 0.9;
        gradient(2) = -1.1;
    elseif threshold2 == -0.8 * x1 + 1.2 * x2 - 1
        gradient(1) = -0.8;
        gradient(2) = 1.2;
    else
        gradient(1) = -1.1;
        gradient(2) = -0.9;
    end
end
