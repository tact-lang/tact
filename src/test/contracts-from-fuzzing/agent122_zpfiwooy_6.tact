contract TestReturnValid {
    // Test 1: Early return in nested block
    fun earlyReturn(x: Int): Int {
        if (x > 0) {
            return x;
        } else {
            { return -x; }
        }
    }

    // Test 2: Multiple return paths
    fun multipleReturns(cond: Bool): Int {
        if (cond) { return 1; } else { return 0; }
    }

    // Test 3: Return inside a simple block
    fun returnInBlock(): Int {
        { return 42; }
    }

    // Test 4: Return inside a repeat loop
    fun returnInRepeat(): Int {
        repeat (3) {
            if (true) { return 999; }
        }
        return 0;
    }

    // Test 5: Getter returning a primitive
    get fun getValue(): Int {
        return 100;
    }

    // Test 6: Getter with nested block
    get fun getComplex(): Int {
        let x: Int = 10;
        { let y: Int = 32; return x + y; }
    }

    // Test 7: Receiver with return statement (no value expected)
    receive() {
        return;
    }

    // Test 8: Implicit return without final semicolon
    fun implicitReturn(x: Int): Int {
        return x
    }

    // Test 9: Complex flow with nested loops and blocks
    fun complexFlow(cond: Bool): Int {
        if (cond) {
            repeat (2) {
                if (true) { return 888; }
            }
        } else {
            return 111;
        }
        return 0;
    }
}
