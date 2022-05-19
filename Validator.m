classdef Validator
    methods(Static)
        function error = validateInput(fnStr, minX, maxX, plotList)
            newStr = strrep(fnStr,'/','./');
            newStr = strrep(newStr,'*','.*');
            newStr = strrep(newStr,'^','.^');
            
            
            error = '';
            try
                x = linspace(minX,maxX);
                fn = eval(newStr);
            catch e
                switch e.identifier
                    case 'MATLAB:m_missing_operator'
                        error = 'Operator missing, Please check if input function is complete and in correct format';
                    case 'MATLAB:m_incomplete_statement'
                        error = 'Invalid Function, Please check if input function is complete and in correct format';
                    case 'MATLAB:UndefinedFunction'
                        error = 'Undefined Variable, Please enter a function of x';
                    otherwise
                       display(e.identifier);
                       display(e.message);
                       error = e.message;
                end
%                 display(error);
                return;
            end
            %
            if any(strcmp(plotList, fnStr))
                error = 'Function is already plotted, Please remove plot to replot using different domain';
            end
            %
            if minX >= maxX
                error = 'Invalid Domain Entered, Plese make sure the maximum x value is higher than the minimum';
            end            
        end
    end
end