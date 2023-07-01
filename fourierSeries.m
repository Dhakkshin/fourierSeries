clear all;
clc;

% Create symbolic variable x
syms x

% Initialize the sum of the Fourier series to 0
fourierSum = 0;

% Define the equation 
originalFunction = 4 * (cos(x/2))^100;

% Calculate a0
a0 = (1/pi) * int(originalFunction, x, -pi, pi);

% Adding a0 to the fourierSum
fourierSum = a0/2;
% Compute the summation from 1 to n
 for n = 1:15
    %Calculate the coefficients an and bn
    an = (1/pi) * int(originalFunction * cos(n*x), x, -pi, pi);
    bn = (1/pi) * int(originalFunction * sin(n*x), x, -pi, pi);
    
    % Add the term to the Fourier series
    fourierSum = fourierSum + (an * cos(n*x) + bn * sin(n*x));
end

% Create a new figure
f = figure;

% Plot the original equation
ezplot(originalFunction, [-2 * pi, 2 * pi]);

% Adding gridlines
grid on;
% Retaining previous graph
hold on;

% Plot the Fourier equation
ezplot(fourierSum, [-2 * pi, 2 * pi]);

% Set the y-axis limits
ylim([-1, 5]);

% Save the plot as an image file (PNG)
saveas(f, '/MATLAB Drive/fourier_series_plot_n=15.png', 'png');
