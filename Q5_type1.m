%Q5-Type I
clear
clearvars
clc
close all

% Variables 
R_1 = 5e4;
C_1 = 8e-6;

% Transfer function of Type-I
numerator  = [1];
denominator  = [R_1*C_1,0];
transfer_function = tf(numerator, denominator);

% Transfer function of Type-I
numerator = [1];
denominator = [R_1 * C_1, 0];
transfer_function = tf(numerator, denominator);

% Create the Bode plot
figure;
bode(transfer_function);

% Add title and grid for better readability
title('Bode Plot (Gain and Phase) of the Type-I Transfer Function');
grid on;



