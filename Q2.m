clear
clearvars
clc

% Parameters
L_out = 8e-6;    % H
C_out = 8e-6;    % F
R_c = 15e-3;     % Ohm
V_in = 5;        % V
V_out = 3.3;     % V
I_out = 4;       % A
f_sw = 250e3;    % Hz
V_ref = 1.2;     % V
V_osc = 1.8;     % V

%determined variables
R_load = V_out/I_out;  % Load resistance

% Transfer function with esr: G_p_with_ESR(s)
numerator_with_ESR  = V_in*R_load * [C_out * R_c, 1];
denominator_with_ESR  = [L_out * C_out * (R_load + R_c), (L_out + R_load * C_out * R_c), R_load];
G_p_with_ESR = tf(numerator_with_ESR, denominator_with_ESR);

% Transfer function without esr: G_p_without_ESR(s)
numerator_without_ESR = V_in*R_load * [0, 1];
denominator_without_ESR = [L_out * C_out * R_load, L_out, R_load];
G_p_without_ESR = tf(numerator_without_ESR, denominator_without_ESR);


% Plot Bode plots
figure;
bode(G_p_with_ESR, 'r', G_p_without_ESR, 'b');
legend('With ESR', 'Without ESR');
grid on;

% Display transfer functions as fractions 
disp('Transfer function with ESR:');
G_p_with_ESR
disp('Transfer function without ESR:');
G_p_without_ESR

% Gain margin and phase margin
[Gm_with_ESR, Pm_with_ESR, Wcg_with_ESR, Wcp_with_ESR] = margin(G_p_with_ESR);
[Gm_without_ESR, Pm_without_ESR, Wcg_without_ESR, Wcp_without_ESR] = margin(G_p_without_ESR);

% Display margins
disp('With ESR:');
fprintf('Gain Margin: %.2f dB\n', 20*log10(Gm_with_ESR));
fprintf('Phase Margin: %.2f degrees\n', Pm_with_ESR);

disp('Without ESR:');
fprintf('Gain Margin: %.2f dB\n', 20*log10(Gm_without_ESR));
fprintf('Phase Margin: %.2f degrees\n', Pm_without_ESR);


