contract ControlFlowFuzzer {
    x: Int;

    // Initialize state variable x
    init() {
        self.x = 0;
    }

    // Function testing a loop with try-catch inside; returns early when condition met using state variable x
    fun loopTryReturn() : Int {
        // Reset state variable x to 0
        self.x = 0;
        repeat (5) {
            try {
                if (self.x == 2) {
                    return self.x; // Early exit when x is 2
                }
                self.x = self.x + 1;
            } catch (e) {
                // Should not happen
                self.x = self.x;
            }
        }
        return self.x;
    }

    // Function with multiple nested try-catch blocks, testing propagation and catch chaining
    fun nestedTryMultiple() : Int {
        try {
            try {
                try {
                    throw(50);
                } catch (a) {
                    // If caught value equals 50, throw modified error
                    if (a == 50) {
                        throw(a + 10); // becomes 60
                    }
                    return a; // not expected
                }
            } catch (b) {
                // b should be 60 if inner catch rethrows
                return b + 5; // expected 65
            }
        } catch (c) {
            return c + 100; // not expected in this scenario
        }
    }

    // Test fallthrough: try block without error, catch not executed
    fun testFallthrough() : Int {
        try {
            self.x = 10;
        } catch (e) {
            self.x = e;
        }
        return self.x; // expected to be 10
    }

    // Receiver test: When receiving message "test", immediately return
    receive("test") {
        try {
            return; // Immediate exit from receiver
        } catch (e) {
            // Not expected to be executed
        }
    }
}

// Standalone function outside of any contract, testing try-catch and immediate return
fun standaloneFlowTest() : Int {
    try {
        return 7;
    } catch (e) {
        return 0;
    }
}
