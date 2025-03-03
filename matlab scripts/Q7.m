%Q7-Type III A & B bode plots
clear
clearvars
clc
close all

is_type_A = true;

if is_type_A
    %Values for TypeIII-A: R_f1, R_C1, R_f3, C_C1, C_C2, C_f3
    R_f1 = 2.9e3; % Replace with your specific value
    R_C1 = 6.57e3; % Replace with your specific value
    R_f3 = 720; % Replace with your specific value
    C_C1 = 1.61e-9; % Replace with your specific value
    C_C2 = 0.2e-9; % Replace with your specific value
    C_f3 = 2.2e-9; % Replace with your specific value
else    
    % Values for TypeIII-B: R_f1, R_C1, R_f3, C_C1, C_C2, C_f3
    R_f1 = 79.96e3; % Replace with your specific value
    R_C1 = 9.139e3; % Replace with your specific value
    R_f3 = 380; % Replace with your specific value
    C_C1 = 37e-9; % Replace with your specific value
    C_C2 = 140e-12; % Replace with your specific value
    C_f3 = 2.2e-9; % Replace with your specific value
end

% Numerator coefficients
numerator = [R_C1 * C_C1 * C_f3 * (R_f1 + R_f3) , (R_C1 * C_C1 + C_f3 * (R_f1 + R_f3)), 1 ];

% Denominator coefficients
denominator = [R_f1 * R_C1 * C_C1 * C_C2 * R_f3 * C_f3, R_f1 * C_C1 * (R_C1 * C_C2 + R_f3 * C_f3), R_f1 * C_C1, 0];

% Transfer function
transfer_function = tf(numerator, denominator)

% Create the Bode plot and calculate margins
figure;
[~,~,~,wcg] = bode(transfer_function);
[GM, PM, Wcg, Wcp] = margin(transfer_function);

% Plot Bode plot with gain and phase margins
margin(transfer_function);
xlim([1 10^10]); % Set x-axis limits to display up to 10^10 Hz

% Add title and grid for better readability
title('Bode Plot (Gain and Phase) of the Transfer Function For TypeIII-A');
grid on;

% Display gain and phase margins
disp(['Gain Margin (GM): ', num2str(20*log10(GM)), ' dB']);
disp(['Phase Margin (PM): ', num2str(PM), ' degrees']);
disp(['Gain Crossover Frequency (Wcg): ', num2str(Wcg), ' rad/s']);
disp(['Phase Crossover Frequency (Wcp): ', num2str(Wcp), ' rad/s']);
