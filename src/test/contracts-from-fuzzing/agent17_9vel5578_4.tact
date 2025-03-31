/* Advanced Control Flow Tests for Tact Compiler
   This suite further examines control-flow constructs, mixing returns, try-catch blocks, and nested control flows.
*/

// Advanced Test 1: if-else within a try block
fun advancedFlow1(x: Int): Int {
    try {
        if (x > 0) {
            return 1;
        } else {
            return -1;
        }
    } catch (e) {
        return 0;
    }
}

// Advanced Test 2: Loop with conditional return inside try block
fun advancedFlow2(): Int {
    try {
        // Using a repeat loop with a condition that may or may not trigger a return
        // Although the condition is constant false here, it's for control-flow path testing
        repeat (5) {
            if (2 + 2 == 5) {
                return 50;
            }
        }
        return 200;
    } catch (e) {
        return e;
    }
}

// Advanced Test 3: Nested try-catch within if-else branches
fun advancedFlow3(x: Int): Int {
    if (x == 0) {
        try {
            throw(10);
        } catch (e) {
            return e;
        }
    } else {
        try {
            if (x > 0) {
                return 1;
            } else {
                try {
                    throw(20);
                } catch (e) {
                    return e;
                }
            }
        } catch (e2) {
            return e2;
        }
    }
}

// Advanced Test 4: Try block that executes normally without errors
fun advancedFlow4(): Int {
    try {
        let a: Int = 10;
    } catch (e) {
        return -1;
    }
    return 30;
}
