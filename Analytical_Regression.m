function [ weights ] = Analytical_Regression( X, Y )

weights = [0;0];

meanX = mean(X);
meanY = mean(Y);

%Following the linear regression formula
txy = 0;
txx = 0;

for i = 1:length(X);
    txy = txy + ((X(i) - meanX) * (Y(i) - meanY));
    txx = txx + ((X(i) - meanX) .^2);
end

weights(2,1) = txy / txx;
weights(1,1) = meanY - (weights(2,1) * meanX);

end

