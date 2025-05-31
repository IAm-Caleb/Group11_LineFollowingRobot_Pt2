figure;
hold on;
grid on;
axis equal;
xlabel('X position');
ylabel('Y position');
title('Line Following Robot Path Animation');

% Plot the path background (optional)
plot(tout, out, 'k--'); % dashed line showing full path

% Initialize the robot's marker on the plot
hRobot = plot(tout(1), simout(1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

% Animation loop
for k = 2:length(tout)
    set(hRobot, 'XData', x(k), 'YData', y(k)); % move robot marker
    pause(0.05); % control animation speed (adjust as needed)
end
