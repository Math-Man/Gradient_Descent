function [ ow0, ow1, loss, ct, ctt ] = Gradient_Descent( X, Y, w0, w1, alpha, stoppingCondition )

   error = sse(X, Y, w0, w1);  %Sum of squared errors
   ct = 0; 
   loss = [];
   ctt = [];
   ow0 = [];
   ow1 = [];
   
   while (error) > stoppingCondition
       
       
       cw0Sum = 0;
       cw1Sum = 0;
       for i = 1:length(X)
            cw0Sum = cw0Sum + (Y(i) - (w0 + X(i)*w1));
            cw1Sum = cw1Sum + (Y(i) - (w0 + X(i)*w1)) * X(i);
       end
       
       cw0 = w0 + (alpha * cw0Sum);
       cw1 = w1 + (alpha * cw1Sum);
       
       prev_error = sse(X, Y, w0, w1);
       
       w0 = cw0;
       w1 = cw1;
       
       curr_error = sse(X, Y, w0, w1);
       error = prev_error - curr_error;
       
       ow0 = [ow0, w0];
       ow1 = [ow1, w1];
       
       text = sprintf('iteration: %d | w0: %d | w1: %d | error: %d',ct, w0, w1, error);
       disp(text);
       
       if ct < 50
           loss = [loss, error]; %add error to loss array
           ctt = [ctt, ct];
       end
       
       ct = ct+1;
   end
       
end

