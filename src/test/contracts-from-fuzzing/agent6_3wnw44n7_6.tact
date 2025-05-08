contract TestExtended {
    // Persistent state variable
    state: Int;

    init() {
        self.state = 0;
    }

    // Test 11: Nested conditional control flow with inner try-catch
    fun test11(x: Int, flag: Bool): Int {
        try {
            if (flag) {
                try {
                    if (x > 100) { return 1000; }
                } catch (e) {
                    return 500;
                }
            } else {
                return -100;
            }
            return 42;
        } catch (err) {
            return 0;
        }
    }

    // Test 12: Unconditional throw inside try leading to catch that returns the exit code
    fun test12(): Int {
        try {
            throw(42);
        } catch (err) {
            return err;
        }
    }

    // Test 13: Getter with nested if-else inside try
    get fun test13(): Int {
        try {
            if (self.state % 2 == 0) { 
                return 2; 
            } else { 
                return 3; 
            }
        } catch (err) {
            return -1;
        }
    }

    // Test 15: Nested try-catch with rethrowing based on error code
    fun test15(x: Int): Int {
        try {
            try {
                if (x < 0) { throw(1); }
                if (x == 1) { throw(2); }
                return x + 10;
            } catch (err) {
                if (err == 1) { return -1; }
                else { throw(3); }
            }
        } catch (err2) {
            return -2;
        }
    }

    // Test 14: Receiver-level control flow with conditional returns and try-catch
    receive("control") {
        if (now() % 5 == 0) { return; }
        try {
            if (now() % 7 == 0) { throw(10); }
            return;
        } catch (err) {
            // In a real contract, send() is used to reply; here we simulate by just returning
            return;
        }
    }
}
