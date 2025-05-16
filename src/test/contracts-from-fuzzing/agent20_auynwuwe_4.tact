contract ControlFlowTest2 {
    // Function-level control flow: try-catch with return
    fun testReturn1(x: Int) : Int {
        try {
            if (x < 0) { throw(101); } // throws if x is negative
            return x * 2;
        } catch(e) {
            return -1;
        }
    }

    // Nested try-catch: inner try returns modified error code
    fun testNested(x: Int) : Int {
        try {
            try {
                if (x == 0) { throw(4); } // simulate error condition
                return 100 / x;
            } catch(inner) {
                return inner + 10;
            }
        } catch(outer) {
            return outer - 10;
        }
    }

    // Early return modified to avoid unreachable code error
    fun testEarlyReturn(x: Int) : Int {
        if (x > 0) { 
            return x; 
        } else {
            try { 
                throw(7);
            } catch(e) { 
                return e; 
            }
        }
    }

    // Using throwIf: conditionally throw when x is negative
    fun testThrowIf(x: Int) : Int {
        try {
            throwIf(1024, x < 0);
            return x;
        } catch(e) {
            return e;
        }
    }

    // Using throwUnless: throw unless x equals 10
    fun testThrowUnless(x: Int) : Int {
        try {
            throwUnless(2048, x == 10);
            return x * 10;
        } catch(e) {
            return e;
        }
    }

    // State variable for receiver tests
    v: Int;
    
    // Initialize state
    init() {
        self.v = 0;
    }

    // Receiver-level control flow with early exit and try-catch
    receive() {
        try {
            // If sender is the contract itself, exit early
            if (sender() == myAddress()) { 
                self.v = 1;
                return;
            }
            // Otherwise, throw an error
            { throw(999); }
        } catch(e) {
            self.v = e;
        }
    }

    // Another receiver to test nested try-catch in message handling
    receive("complex") {
        try {
            try {
                { throw(88); }
            } catch(e1) {
                // If error captured equals 88, rethrow a different error
                if (e1 == 88) { 
                    throw(77);
                }
                return;
            }
        } catch(e2) {
            self.v = e2;
        }
    }
}
