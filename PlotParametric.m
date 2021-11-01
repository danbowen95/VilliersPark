clc   % Clears the command window
clear % Clears all Vars
close % Closes any figures

% Inputs:
nVals = 1000;  % How many equally spaced increments of t shall we use
A = 8;         % Coefficient's
B = 3;
C = 5;

% Create places to store data
t = linspace(0,2*pi,nVals);
x = zeros(size(t));
y = zeros(size(t));

% Now loop through each t value, then solve and stor x and y values
for i = 1:nVals
    x(i) = cos(A*t(i)) + (cos(B*t(i))/2) + (sin(C*t(i))/3);
    y(i) = sin(A*t(i)) + (sin(B*t(i))/2) + (cos(C*t(i))/3);
end

% Now do a pretty plot
figure
strTitle = ["A = " num2str(A)];
plot(x,y)
strTitle = ["A = " num2str(A) " , B = " num2str(B) " , C = " num2str(C)];
title(strTitle);
