% Define the values for R_1, R_C1, C_C1, and C_C2
R_1 = 1e3; % Replace with your specific value
R_C1 = 62.3e3; % Replace with your specific value
C_C1 = 508e-9; % Replace with your specific value
C_C2 = 58e-9; % Replace with your specific value

% Numerator and Denominator of the transfer function
numerator = [1, R_C1 * C_C1];
denominator = [R_1 * R_C1 * C_C1 * C_C2, R_1 * C_C1, 0];

transfer_function = tf(numerator, denominator);

% Create the Bode plot
figure;
bode(transfer_function);

% Add title and grid for better readability
title('Bode Plot (Gain and Phase) of the Type-I Transfer Function');
grid on;

