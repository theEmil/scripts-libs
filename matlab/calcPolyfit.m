% a wrapper for the polyfit function that minimizes boilerplate code
% x - x-axis values
% y - y-axis values to fit to
% n - polynomial degree of fit
% silent - supress output of functional equation, default is to output the equation (0)
function Result = calcPolyfit(x, y, n, silent)
    if ~exist('silent','var')
        silent = 0;
    end
    coefficient = polyfit(x,y,n); 
    if(silent == 0)
        Output = "functional equation:";
        for i = 1:length(coefficient)
            if coefficient(i) < 0
                Output = Output +" "+ coefficient(i)+"*x^"+(length(coefficient)-i);
            else
                Output = Output +" +"+ coefficient(i)+"*x^"+(length(coefficient)-i);
            end
        end
        disp(Output);
    end
    Result.x = x;
    Result.y = polyval(coefficient,x);
    Result.coefficients = coefficient;
end
