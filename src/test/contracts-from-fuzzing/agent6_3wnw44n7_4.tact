contract Test {
    // Persistent state variable declared without the 'var' keyword
    state: Int;

    // init function to initialize persistent state variables
    init() {
        self.state = 0;
    }

    // Test 1: Simple function-level early return
    fun test1(): Int {
        return 42;
    }

    // Test 2: try-catch with early returns in both blocks using correct catch clause syntax
    fun test2(flag: Bool): Int {
        try {
            if (flag) { return 1; }
        } catch (err) {
            return 2;
        }
        return 0;
    }

    // Test 3: try block with explicit error throwing and catch handling
    fun test3(x: Int): Int {
        try {
            if (x == 0) { throw(1); }
            return 10 / x;
        } catch (err) {
            return -1;
        }
    }

    // Test 4: Receiver-level control flow with early exit
    // Simulating a message handler using receive
    receive () {
        if (now() % 2 == 0) { return; }
        try {
            if (now() % 3 == 0) { return; }
        } catch (err) {
            // empty catch block
        }
    }

    // Test 5: Nested try-catch with multiple returns
    fun test5(x: Int): Int {
        try {
            if (x < 0) { return -1; }
            try {
                if (x == 0) { return 0; }
                return x;
            } catch (err) {
                return -2;
            }
        } catch (err) {
            return -3;
        }
    }

    // Test 6: Fallthrough in try-catch leading to final return
    fun test6(x: Int): Int {
        try {
            if (x == 10) { return 10; }
        } catch (err) {
            // catch block left intentionally empty
        }
        return x * 2;
    }

    // Test 7: Getter with try-catch modifying state (changes here are not persistent in getters)
    get fun incAndGet(): Int {
        try {
            self.state = self.state + 1;
            return self.state;
        } catch (err) {
            return -1;
        }
    }

    // Test 8: Nested try-catch with a return in an inner try block
    fun test8(x: Int): Int {
        try {
            try {
                if (x < 10) { return 100; }
            } catch (err) {
                return 200;
            }
            return 300;
        } catch (err) {
            return 400;
        }
    }

    // Test 9: Function calling another that may throw, with error propagation caught
    fun mayThrow(x: Int): Int {
        if (x == 0) { throw(5); }
        return 100 / x;
    }

    fun test9(x: Int): Int {
        try {
            return self.mayThrow(x);
        } catch (err) {
            return -1;
        }
    }

    // Test 10: try-catch with nested throw inside catch block conditionally propagating
    fun test10(x: Int): Int {
        try {
            if (x > 5) { throw(10); }
            return x;
        } catch (err) {
            if (x > 10) { throw(20); }
            return -x;
        }
    }
}
