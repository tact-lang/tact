/* Test 8: Nested try/catch with catch rethrowing an exception from within a loop inside a try block.
   This tests deep nesting with exception propagation. */

fun nestedCatchRethrow(): Int {
    let i: Int = 0;
    try {
        repeat (5) {
            i = i + 1;
            if (i == 3) {
                throw(303);
            }
        }
        return 0; // Should not happen if exception is thrown
    } catch (innerErr) {
        // In the catch, let's perform another try block
        try {
            if (innerErr == 303) {
                // Rethrow a new error
                throw(404);
            }
            return innerErr;
        } catch (rethrowErr) {
            // Catch rethrown error
            return rethrowErr;
        }
    }
}

/* Test 9: Complex function-level control flow combining multiple returns, try/catch and loop early exit. */

fun complexFlow(x: Int): Int {
    if (x < 0) {
        return -1; // early normal exit
    }
    try {
        let sum: Int = 0;
        repeat (5) {
            sum = sum + 10;
            if (sum >= 30) {
                return sum; // early exit from try
            }
        }
        // Should not reach here normally
        return sum;
    } catch (err) {
        // In case anything fails, return error code plus 100
        return err + 100;
    }
}

/* Test 10: Receiver-level control flow test where try block modifies state then returns inside catch.
   This simulates a contract's receive handler handling messages and doing state changes in catch.
*/

contract ReceiverComplex {
    counter: Int;

    init() {
        self.counter = 0;
    }

    receive("complex") {
        try {
            self.counter = 50;
            // Simulate an error condition
            throw(888);
        } catch (e) {
            // Modify state in catch
            self.counter = self.counter + e; // should become 50 + 888 = 938
        }
    }

    get fun getCounter(): Int {
        return self.counter;
    }
}

/* Test 11: Nested try block with return inside inner try.
   This test ensures that the inner try return works and subsequent code in outer try is not executed.
*/

fun nestedReturnTest(): Int {
    try {
        try {
            // Early return inside inner try
            return 555;
        } catch (err) {
            // This catch should never trigger
            return 0;
        }
    } catch (outerErr) {
        return outerErr;
    }
}

/* Test 12: Complex combination with throwIf and throwUnless nested in try blocks, with multiple conditions. */

fun multiConditionalThrows(a: Int, b: Int): Int {
    try {
        throwIf(101, a > 10);
        throwUnless(202, b == 20);
        return a + b;
    } catch (err) {
        return err; // Return the error code caught
    }
}

/* Test 13: Loop inside try with return from within a nested conditional and verifying that loop terminates. */

fun loopInsideTry(): Int {
    try {
        let i: Int = 0;
        repeat (10) {
            i = i + 1;
            if (i == 4) {
                return i; // Early exit
            }
        }
        return i;
    } catch (err) {
        return err + 1000;
    }
}

/* Main entry point to run all tests, dumping their results. */

fun main() {
    dump(nestedCatchRethrow());      // Expected: 404
    dump(complexFlow(5));             // Expected: early exit in try with sum >= 30, which gives 30
    dump(complexFlow(-3));            // Expected: -1 as x < 0
    dump(nestedReturnTest());         // Expected: 555
    dump(multiConditionalThrows(5, 20));  // Expected: 25 (5+20), since a is not >10 and b==20
    dump(multiConditionalThrows(15, 20)); // Expected: 101 from throwIf
    dump(multiConditionalThrows(5, 10));  // Expected: 202 from throwUnless
    dump(loopInsideTry());               // Expected: 4
}
