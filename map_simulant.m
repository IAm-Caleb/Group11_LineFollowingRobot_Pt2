% Simulated longer robot path
x = linspace(0, 20, 100);               % X-coordinates (longer path)
y = sin(x/2) + 5;                       % Y-coordinates (sine wave path for visual interest)

% Define obstacles
obstacles = [5 5.5; 10 6; 15 4.5];      % Example obstacle positions

% Create figure and axis
figure;
axis([0 22 0 11]);
grid on;
hold on;
xlabel('X-axis');
ylabel('Y-axis');
title('Extended Robot Path Simulation');

% Plot full track
plot(x, y, 'k--', 'LineWidth', 1);

% Plot obstacles
for i = 1:size(obstacles, 1)
    rectangle('Position', [obstacles(i,1)-0.2 obstacles(i,2)-0.2 0.4 0.4], ...
              'FaceColor', 'r', 'EdgeColor', 'k');
end

% Animate robot on the path slowly
robot = plot(x(1), y(1), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
for k = 2:length(x)
    set(robot, 'XData', x(k), 'YData', y(k));
    pause(0.1); % slower animation speed
end
