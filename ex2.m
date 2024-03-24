% Setting parameters
param_a = 0.04;
param_ALPHA = 10;

% Generating matrix A
matrix_A = [1 - param_a * param_a * param_ALPHA, 0; 
            0, 1 - 2 * param_a / param_ALPHA];

% Calculate and display the condition number
condition_number_A = cond(matrix_A);
fprintf('The condition number of matrix A: %f\n', condition_number_A);

% After 20 steps
fprintf('After 20 iterations:\n');
matrix_A_20 = matrix_A^20;
disp(matrix_A_20);

% After 100 steps
fprintf('After 100 iterations:\n');
matrix_A_100 = matrix_A^100;
disp(matrix_A_100);

% Applying the method of momentum
param_a = 0.04;
param_ALPHA = 10;

% Initial guess
initial_guess_x = [0.6; -0.4];

% Momentum parameters
momentum_alpha1 = 0.1;
momentum_alpha2 = 0.1;
momentum_v = 0;

for iter = 1:200
    % Computing gradient
    gradient = [2 * param_ALPHA * initial_guess_x(1);
                2 * initial_guess_x(2) / param_ALPHA];
    
    % Momentum update
    momentum_v = momentum_alpha1 * momentum_v - momentum_alpha2 * gradient;
    
    % Update with momentum
    initial_guess_x = initial_guess_x + momentum_v;
    
    % Displaying the result at every 10th iteration
    if mod(iter, 10) == 0
        fprintf('Iteration %d: x = [%f, %f]\n', iter, initial_guess_x(1), initial_guess_x(2));
    end
    
    % Storing values for plotting
    plot_x1(iter) = initial_guess_x(1);
    plot_x2(iter) = initial_guess_x(2);
end
