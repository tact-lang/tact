contract TestControlFlowEx {
    // Test that repeat loop does not execute if count is 0
    fun testRepeatZero() : Int {
        let acc: Int = 1;
        repeat (0) {
            acc *= 2;
        }
        return acc; // Expected: 1
    }

    // Test that repeat loop does not execute if count is negative
    fun testRepeatNegative() : Int {
        let acc: Int = 1;
        repeat (-5) {
            acc *= 2;
        }
        return acc; // Expected: 1
    }

    // Test that do...until executes at least once even if condition is true initially
    fun testDoUntilTrueInitially() : Int {
        let count: Int = 0;
        do {
            count += 1;
        } until (true);
        return count; // Expected: 1
    }

    // Test while loop that never executes
    fun testWhileNever() : Int {
        let x: Int = 0;
        while (x > 0) {
            x = 100;
        }
        return x; // Expected: 0
    }

    // Test try-catch when try block succeeds
    fun testTrySuccess() : Int {
        try {
            return 42;
        } catch (e) {
            return 0;
        }
    }

    // Test nested try-catch: inner catch does division by zero causing error, then outer catch catches it
    fun testNestedTryCatch() : Int {
        try {
            let x: Int = 0;
            try {
                throw(50);
            } catch (ex) {
                // this division by zero will trigger error with exit code 4
                return ex / x;
            }
        } catch (e) {
            return e; // Expected: exit code 4
        }
    }
}
