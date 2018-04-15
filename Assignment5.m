clear variables

data = load('data.txt'); %Read data

%Split data into X and Y

X = data(:, 1); %Seperated Data for X
Y = data(: ,2); %Seperated Data for Y

Weights = [-2; 4];  %initial weights
Alpha = 0.0001; % learning rate
StoppingCondition = 0.001; % stopping condition


%Calculate Analytical_Regression
wt = Analytical_Regression(X, Y);
%Calculate Gradient Descent
[ w1, w0, loss, ct, ctt ] = Gradient_Descent( X, Y, Weights(1,1), Weights(2,1), Alpha, StoppingCondition ); 



fig1 = figure(1);
set(fig1, 'Position', [100,100,700,700]);
subplot(3,1,1); %Figure for analytical Reg.
plot(X, Y, '.', 'MarkerSize', 4);
hold on
hl = refline(wt(2,1), wt(1,1)); %Draw a straight line with given weights
hl.Color = [1,0.5,0.3];

%Sum up the errors here and draw the lines between points and the line
AnalyticalError = 0; %Analytical total error
for i = 1:length(X)
    line([X(i), X(i)], [Y(i), X(i)*wt(2,1) + wt(1,1)], 'Color', [0.8,0.8,0.8]);
    AnalyticalError = AnalyticalError + (Y(i) - (X(i)*wt(2,1) + wt(1,1))).^2;
end
ttt = sprintf('Analytical Error: %d',AnalyticalError);
text(5.7,27,ttt);

ttt2 = sprintf(' Weight 0 : %d | Weight 1: %d',wt(1,1), wt(2,1));
text(3,33,ttt2);

ttt3 = sprintf('Total Iterations : %d', ct);
text(6.9,-90,ttt3);

ttt4 = sprintf('Iteration: %d | Weight 0 : %d | Weight 1: %d', ct ,wt(1,1), wt(2,1));
text(-5.5,-150,ttt4);

ttt5 = sprintf('Total Error: %d', loss(end));
text(5.2,-150,ttt5);

hold off
title('Analytical Regression');
zoom on
text = sprintf('Analytical Error: %d | Weight 0 : %d | Weight 1: %d',AnalyticalError, wt(1,1), wt(2,1));
disp(text);

subplot(3,1,2); %Figure for gradient Descent
plot(ctt, loss);
hold on
scatter(ctt, loss, 8, 'filled', 'd', 'MarkerFaceColor', [0.5,0.5,0.9],'MarkerEdgeColor',[0 .5 .5]);
hold off
ylim([0 inf])
title('Loss vs Iteration');

subplot(3,1,3);%Contour graph and scatter
[cx, cy, cz] = ContourCalc(X, Y, Alpha);
contour(cx,cy,cz, 60);
hold on
scatter(w1, w0, 2, 'filled', 'd', 'MarkerFaceColor', [1,0.5,0.3], 'MarkerEdgeColor',[1,0.3,0.1]);
plot(w1(1),w0(1),'r*')
hold off
title('Gradient Descent');

%figure(2)
%plot(X, Y, '.', 'MarkerSize', 4);

