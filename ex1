% Setting seed for reproducibility
rng(2);

% Generating two normally distributed random numbers with mean 0 and standard deviation 1
random_numbers = randn(2, 1);
random_numbers = [0.1 ; 0.1];

% Number of iterations
iterations = 30;

% Step size for gradient descent
learning_rate = 0.01;

% Initial point
initial_point = random_numbers;

% Initializing array to store trajectory
trajectory = initial_point;

% Gradient Descent for 'iterations' steps
for iter = 1:iterations
    % Computing gradient
    gradient = [2 * initial_point(1) + 4 * (initial_point(1) - initial_point(2))^3;
                2 * (initial_point(2) - 1) + 4 * (initial_point(2) - initial_point(1))^3];
    
    % Update rule
    updated_point = initial_point - learning_rate * gradient;
    
    % Updating trajectory
    trajectory = [trajectory, updated_point];
    
    % Computing value
    value(iter) = initial_point(1)^2 + (initial_point(2) - 1)^2 + (initial_point(1) - initial_point(2))^4;
    
    % Updating initial point
    initial_point = updated_point;
end

% Plotting trajectory
figure;
plot(trajectory, '-x');

% Plotting trajectory (transpose)
figure;
plot(trajectory', '-x');

% Plotting trajectory in 2D
figure;
plot(trajectory(1,:), trajectory(2,:), '-x');

% Plotting value
figure;
plot(value);

% Convergence rate
figure;
plot(log(value - value(end)));

% Newton's Method
initial_point_newton = randn(2, 1);
trajectory_newton = initial_point_newton;
learning_rate_newton = 1;
for iter = 1:iterations
    gradient = [2 * initial_point_newton(1) + 4 * (initial_point_newton(1) - initial_point_newton(2))^3;
                2 * (initial_point_newton(2) - 1) + 4 * (initial_point_newton(2) - initial_point_newton(1))^3];
    updated_point_newton = initial_point_newton - learning_rate_newton * inv(hessian(initial_point_newton)) * gradient;
    trajectory_newton = [trajectory_newton, updated_point_newton];
    value_newton(iter) = initial_point_newton(1)^2 + (initial_point_newton(2) - 1)^2 + (initial_point_newton(1) - initial_point_newton(2))^4;
    initial_point_newton = updated_point_newton;
end

% Plotting trajectories of Gradient Descent and Newton's Method
figure;
plot(trajectory', '-x', 'DisplayName', 'Gradient Descent');
hold on;
plot(trajectory_newton', '-o', 'DisplayName', "Newton's Method");
title("Trajectories with Gradient Descent and Newton's Method");
legend;

% Function to compute Hessian
function H = hessian(x)
    H = [2 + 12*(x(1) - x(2))^2, -12*(x(1) - x(2))^2;
         -12*(x(1) - x(2))^2, 2 + 12*(x(2) - x(1))^2];
end
