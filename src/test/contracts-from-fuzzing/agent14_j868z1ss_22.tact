// NegativeRepeatTest: Testing repeat loop with a negative count

contract NegativeRepeatTest {
    state: Int = 0;

    receive("repeat") {
        // According to documented behavior, a negative repeat count should result
        // in the loop block not being executed at all.
        repeat(-5) {
            self.state = self.state + 1;
        }
    }
}

// ComplexControlFlowTest: A contract that nests try-catch, repeat loops, and if-else
// to test that complex control flow operates correctly.

contract ComplexControlFlowTest {
    state: Int = 0;

    // An internal function that adds its argument to the state
    fun addToState(a: Int) {
        self.state = self.state + a;
    }

    // An internal function that intentionally fails if a is not even
    fun requireEven(a: Int) {
        require(a % 2 == 0, "Not an even number");
    }

    receive("complex") {
        let x: Int = 3;

        // Outer try-catch; if any error is thrown, subtract 5 from state
        try {
            // Nested try-catch inside a repeat loop
            repeat(3) {
                // Increase state by 2 for each iteration
                self.addToState(2);

                // A conditional branch
                if (x % 2 == 1) {
                    // x is odd; try a nested try-catch block
                    try {
                        self.requireEven(x);
                        self.addToState(100); // should not happen
                    } catch (innerErr) {
                        // Catch the error: add 1 to state
                        self.addToState(1);
                    }
                } else {
                    // If even, add 10
                    self.addToState(10);
                }
                // Modify x on each iteration
                x = x + 1;
            }
        } catch (outerErr) {
            self.addToState(-5);
        }
    }
}
