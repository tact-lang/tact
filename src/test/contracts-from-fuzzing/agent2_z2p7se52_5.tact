// Extensive fuzzy test of control flow constructs in Tact

// Function using throwIf and throwUnless inside a try block with conditional branches
fun conditionalThrowTest(a: Int): Int {
    try {
        // Throw if a is even, otherwise do nothing
        throwIf(101, a % 2 == 0);
        // Throw unless a is positive
        throwUnless(102, a > 0);
        // If both conditions are satisfied, return a multiplied by 10
        return a * 10;
    } catch (e) {
        // Return the caught error code plus the input to indicate error context
        return e + a;
    }
}

// Function with a loop inside a try block combined with nested try-catch
fun loopAndNestedTryTest(limit: Int): Int {
    let sum = 0;
    try {
        // Repeat loop 'limit' times
        repeat (limit) {
            // Nested try block: if the sum is less than limit, add 5; otherwise, if sum < limit*2, throw an error; else add 1
            try {
                if (sum < limit) {
                    // Do some processing, add 5
                    sum = sum + 5;
                } else if (sum < limit * 2) {
                    // In this branch, rethrow an error with modified code
                    throw(200);
                } else {
                    // Otherwise, simply add 1
                    sum = sum + 1;
                }
            } catch (inner) {
                // For inner catch, accumulate the error code
                sum = sum + inner;
            }
        }
        // If the loop completes without outer error, return sum
        return sum;
    } catch (outer) {
        // In case of an outer error
        return outer;
    }
}

// Function with a nested try-catch chain that computes a result from catch blocks
fun nestedTryChainTest(x: Int): Int {
    try {
        try {
            if (x == 0) {
                // Force error for x == 0
                throw(300);
            } else {
                // If x is non-zero, multiply by 2
                return x * 2;
            }
        } catch (inner) {
            // Modify the error code by adding 10
            throw(inner + 10);
        }
    } catch (outer) {
        // Return the final error code if caught
        return outer;
    }
}

// Function combining if-else with try-catch and loop, emphasizing early return
fun complexMixedControlFlow(flag: Bool, x: Int): Int {
    let result = 0;
    if (flag) {
        try {
            repeat (3) {
                // If condition met, return immediately
                if (x > 100) {
                    return 999;
                } else {
                    result = result + 5;
                }
            }
            // After loop, if result is 15, throw an error
            if (result == 15) {
                throw(400);
            }
            // Otherwise return computed result
            return result;
        } catch (e) {
            // In catch, return error code plus result
            return e + result;
        }
    } else {
        // If flag is false, simply return x
        return x;
    }
}

// Contract-level control flow test: a contract with two receive handlers testing different execution paths
contract ControlFlowContract {
    counter: Int;
    flag: Bool;

    // Initialization to set the state variables
    init() {
        self.counter = 0;
        self.flag = false;
    }

    // A default receive handler without message content
    receive() {
        try {
            // Update counter conditionally
            if (self.flag) {
                self.counter = self.counter + 1;
                return;
            } else {
                throw(50);
            }
        } catch (e) {
            // In catch, set counter to the error code
            self.counter = e;
            return;
        }
    }

    // A receive handler for a specific message
    receive("update") {
        try {
            // If sender is contract itself, update counter by a fixed value
            if (sender() == myAddress()) {
                self.counter = self.counter + 100;
                return;
            } else {
                // Otherwise, simulate complex flow
                let temp = conditionalThrowTest(self.counter);
                self.counter = temp;
                return;
            }
        } catch (err) {
            // Fallback, set counter to error code
            self.counter = err;
            return;
        }
    }
}

// End of fuzzy testing snippet
