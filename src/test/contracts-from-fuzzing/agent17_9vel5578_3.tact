/* Comprehensive Test Suite for Control Flow Semantics in Tact
   This suite tests various aspects of function-level and receiver-level control flows,
   including returns, early exits, try-catch semantics, nested try-catch blocks, and loops.
*/

// Test 1: Simple function-level return
fun simpleReturn(): Int {
    return 42;
}

// Test 2: Function with try-catch including return inside try
fun tryReturn(): Int {
    try {
        return 10;
    } catch (e) {
        return 20;
    }
}

// Test 3: Function with throw and catch, returning the caught error
fun tryCatchThrow(): Int {
    try {
        throw(1042);
    } catch (err) {
        return err;
    }
}

// Test 4: Nested try-catch where inner try throws and inner catch returns
fun nestedTry(): Int {
    try {
        try {
            throw(101);
        } catch (e) {
            return e; // return from inner catch
        }
    } catch (e2) {
        return e2;
    }
    // In theory, code is unreachable due to return in inner catch, but compiler enforces exhaustiveness in try-catch blocks too.
}

// Test 5: Return inside a loop within a try block
fun loopTryReturn(): Int {
    try {
        repeat (3) {
            if (true) {
                return 55;
            }
        }
        return 99; // Will only be reached if loop never triggers the if
    } catch (e) {
        return e;
    }
}

// Test 6: Try block with conditional return inside catch
fun tryWithReturnInCatch(): Int {
    try {
        throw(42);
    } catch (err) {
        if (err == 42) {
            return 1;
        } else {
            return 2;
        }
    }
}

// Test 7: Receiver function with try-catch and return
contract ReceiverTest {
    receive("msg") {
        try {
            throw(103);
        } catch (err) {
            return; // Exiting receiver after handling error
        }
        // No additional code after try-catch to avoid unreachable statement
    }
}

// Test 8: Receiver with branching logic and try-catch (corrected to avoid unreachable code)
contract BranchingReceiver {
    receive("branch") {
        if (sender() == myAddress()) {
            try {
                return;
            } catch (e) {
                // Although this block is unlikely to be reached, handle it gracefully
                return;
            }
        } else {
            return;
        }
        // No extra return; all branches already return
    }
}

// Test 9: Try block that executes normally without throwing an error
fun tryNoError(): Int {
    try {
        let a: Int = 5;
    } catch (e) {
        return 0;
    }
    return 10;
}
