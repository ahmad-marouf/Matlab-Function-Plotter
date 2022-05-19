plotList = {'x*5'};

%% Test 1: No Error
fnStr = 'x * 4'; minX = 0; maxX = 5;
error = Validator.validateInput(fnStr, minX, maxX, plotList);
assert(all(error == ''));

%% Test 2: Invalid Function Error
fnStr = 'x *'; minX = 0; maxX = 5;
error = Validator.validateInput(fnStr, minX, maxX, plotList);
assert(all(error == 'Invalid Function, Please check if input function is complete and in correct format'));

%% Test 3: Replot Error
fnStr = 'x*5'; minX = 0; maxX = 5;
error = Validator.validateInput(fnStr, minX, maxX, plotList);
assert(all(error == 'Function is already plotted, Please remove plot to replot using different domain'));

%% Test 4: Undefined Variable Error
fnStr = 'y + 10'; minX = 0; maxX = 5;
error = Validator.validateInput(fnStr, minX, maxX, plotList);
assert(all(error == 'Undefined Variable, Please enter a function of x'));

%% Test 5: Invalid Domain
fnStr = 'x + 10'; minX = 0; maxX = -1;
error = Validator.validateInput(fnStr, minX, maxX, plotList);
assert(all(error == 'Invalid Domain Entered, Plese make sure the maximum x value is higher than the minimum'));