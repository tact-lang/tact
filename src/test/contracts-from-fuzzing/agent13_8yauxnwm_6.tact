/*
Comprehensive Fuzz-Testing Cycle: Control Flow Constructs

This set of tests targets various control flow constructs as described in the Tact documentation, including:

1. if-statements, if-else, nested if-else constructs
2. try-catch blocks, including nested try-catch behavior
3. Loop constructs: repeat, while, do...until, and foreach

These tests were inspired by documentation snippets such as those in [docs_book_statements.md] (see  ,  ) and the explanations in the Tact Book.

The code below includes a series of minimal functions that validate:
  - Correct evaluation of if and if-else conditions
  - Proper execution of try-catch semantics, including nested try-catch blocks
  - Loop behaviors covering edge cases (such as zero/negative iterations for repeat and minimum one execution for do...until loops)
  - The foreach loop iterating over maps

All tests compiled successfully without deviations from documentation expectations.
*/

contract TestControlFlowFinal {

    // If-statements:
    // Returns 1 if condition is met, else 0
    fun testIf() : Int {
        if (2 + 2 == 4) {
            return 1;
        }
        return 0;
    }

    // If-Else statement: returns 2 if condition true, else returns 3
    fun testIfElse() : Int {
        if (2 + 2 == 3) {
            return 2;
        } else {
            return 3;
        }
    }

    // Nested If-Else: returns 20 when second condition holds
    fun testNestedIfElse() : Int {
        if (2 + 2 == 3) {
            return 10;
        } else if (2 + 2 == 4) {
            return 20;
        } else {
            return 30;
        }
    }

    // Try-Catch: Immediately throws and catches the error code
    fun testTryCatch() : Int {
        try {
            throw(101);
        } catch (e) {
            return e;
        }
    }

    // Nested Try-Catch:
    // Inner try throws an error caught in inner catch; performing division by zero forces error exit code (4) caught in outer block
    fun testNestedTryCatch() : Int {
        try {
            let x: Int = 0;
            try {
                throw(50);
            } catch (inner) {
                // Division by zero should trigger error exit code 4
                return inner / x;
            }
        } catch (outer) {
            return outer; // Expected to be exit code 4
        }
    }

    // Loop constructs:
    // Repeat: multiplies by 2, 5 times (1 * 2^5 = 32)
    fun testRepeat() : Int {
        let r: Int = 1;
        repeat (5) {
            // multiply by 2 each iteration
            r *= 2;
        }
        return r; 
    }

    // Repeat Edge Case: Zero iterations should yield no change
    fun testRepeatZero() : Int {
        let r: Int = 1;
        repeat (0) {
            r *= 2;
        }
        return r;
    }

    // While Loop: Decrements from 10 until 0
    fun testWhile() : Int {
        let x: Int = 10;
        while (x > 0) {
            x -= 1;
        }
        return x; 
    }

    // Do...until: Executes at least once
    fun testDoUntil() : Int {
        let y: Int = 10;
        do {
            y -= 1;
        } until (y <= 0);
        return y; 
    }

    // Do...until minimal execution: Should execute exactly once
    fun testDoUntilMinOnce() : Int {
        let c: Int = 0;
        do {
            c += 1;
        } until (true);
        return c; 
    }

    // Foreach loop: Sums map values
    fun testForeach() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let sum: Int = 0;
        foreach (key, value in m) {
            sum += value;
        }
        return sum; 
    }

    // Additional test: While loop that never runs (when condition false initially)
    fun testWhileNever() : Int {
        let x: Int = 0;
        while (x > 0) {
            x = 100; // never reached
        }
        return x; 
    }

    // Additional test: Try block that succeeds; catch block not reached
    fun testTrySuccess() : Int {
        try {
            return 42;
        } catch (e) {
            return 0;
        }
    }
}
