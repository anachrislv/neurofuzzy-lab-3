% Seeding random number generator
rng(42);

% Number of rows and columns for matrix A
rows_cols = 4;

% Generating a random matrix A
matrix_A = rand(rows_cols, rows_cols);

% Calculating Q = A*A'
matrix_Q = matrix_A * matrix_A';

% Eigenvalues of Q
eigenvalues_Q = eig(matrix_Q);
disp('Eigenvalues of Q:');
disp(eigenvalues_Q);

% Computing the condition number for N = 4
fprintf('For N = 4, the condition number is:\n');
condition_number_N4 = max(eigenvalues_Q) / min(eigenvalues_Q);
disp(condition_number_N4);

% Changing the size of matrix A
rows_cols = 20;
matrix_A = rand(rows_cols, rows_cols);

% Recalculating Q for N = 20
matrix_Q = matrix_A * matrix_A';

% Computing the condition number for N = 20
fprintf('For N = 20, the condition number is:\n');
condition_number_N20 = max(eig(matrix_Q)) / min(eig(matrix_Q));
disp(condition_number_N20);
