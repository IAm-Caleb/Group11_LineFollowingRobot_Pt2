
classdef LineFollowingRobotApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        UIAxes               matlab.ui.control.UIAxes
        StartButton          matlab.ui.control.Button
        TimerObj             timer
        RobotPlot            matlab.graphics.chart.primitive.Line
    end

    properties (Access = private)
        x = 0
        y = 0
        theta = 0
        dt = 0.1
        d = 0.2
        pathX
        pathY
        i = 1
    end

    methods (Access = private)

        function simulateStep(app)
            if app.i >= length(app.pathX)
                stop(app.TimerObj);
                return;
            end

            % Simulated motor speeds
            vL = 0.4 + 0.2*sin(0.1*app.i);
            vR = 0.4 - 0.2*sin(0.1*app.i);

            v = (vL + vR)/2;
            omega = (vR - vL)/app.d;

            app.theta = app.theta + omega * app.dt;
            app.x = app.x + v * cos(app.theta) * app.dt;
            app.y = app.y + v * sin(app.theta) * app.dt;

            % Update path
            app.RobotPlot.XData = [app.RobotPlot.XData app.x];
            app.RobotPlot.YData = [app.RobotPlot.YData app.y];
            drawnow;

            app.i = app.i + 1;
        end

        function onStart(app, ~)
            app.x = 0; app.y = 0; app.theta = 0; app.i = 1;
            app.RobotPlot.XData = [app.x];
            app.RobotPlot.YData = [app.y];
            start(app.TimerObj);
        end
    end

    methods (Access = private)

        function createComponents(app)
            app.UIFigure = uifigure('Position', [100 100 600 400]);
            app.UIAxes = uiaxes(app.UIFigure, 'Position', [50 80 500 300]);
            title(app.UIAxes, 'Line-Following Robot Simulation');
            xlabel(app.UIAxes, 'X (m)');
            ylabel(app.UIAxes, 'Y (m)');
            grid(app.UIAxes, 'on');
            axis(app.UIAxes, 'equal');
            hold(app.UIAxes, 'on');

            app.StartButton = uibutton(app.UIFigure, 'push', ...
                'Text', 'Start Simulation', ...
                'Position', [250 20 120 30], ...
                'ButtonPushedFcn', @(btn,event) onStart(app));

            % Sample curved path
            t = linspace(0, 2*pi, 100);
            app.pathX = cos(t);
            app.pathY = sin(t);
            plot(app.UIAxes, app.pathX, app.pathY, 'k--');

            % Initialize robot path
            app.RobotPlot = plot(app.UIAxes, NaN, NaN, 'b-', 'LineWidth', 2);

            % Timer
            app.TimerObj = timer( ...
                'ExecutionMode', 'fixedRate', ...
                'Period', app.dt, ...
                'TimerFcn', @(~,~) simulateStep(app));
        end
    end

    methods (Access = public)

        function app = LineFollowingRobotApp
            createComponents(app)
        end

        function delete(app)
            try
                stop(app.TimerObj);
                delete(app.TimerObj);
            catch
            end
        end
    end
end
