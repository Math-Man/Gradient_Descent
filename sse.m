function [ s ] = sse( X, Y, w0, w1 )
s = 0;
for i = 1:length(X)
    s = s + (Y(i) - (w0 + X(i)*w1)).^2; %Calculate sum of squared error for given weights
end
end

