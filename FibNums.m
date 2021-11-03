% Code for producing the Fibonacci Series
clc   % Clears the command window
clear % Clears all Vars
close % Closes any figures

% What Fib number do we want?
fMax = 5;

% Define first 2 Fib numbers
F(1) = 1;
F(2) = 1;

% Loop through n=3,n=4,n=5... n=fMax.
for n = 3:fMax
    F(n) = F(n-1) + F(n-2);
end

disp(F(fMax)) % Display F(fMax)
