contract FuzzControlFlow {

    // Test 1: try-catch with no error thrown
    fun testTryNoError(x: Int) : Int {
        try {
            return x + 1;
        } catch(e) {
            return 0;
        }
    }

    // Test 2: try-catch with error thrown conditionally
    fun testTryWithError(x: Int) : Int {
        try {
            if (x < 0) { throw(101); }
            return x;
        } catch(e) {
            return e; // return error code
        }
    }

    // Test 3: Nested try-catch with rethrowing
    fun testNestedTry(x: Int) : Int {
        try {
            try {
                if (x == 0) { throw(202); }
                return 100 / x;
            } catch(inner) {
                if (inner == 202) { throw(303); }
                return inner;
            }
        } catch(outer) {
           return outer;
        }
    }

    // Test 4: Using throwIf
    fun testThrowIf(x: Int) : Int {
        try {
            throwIf(404, x == 0);
            return x + 10;
        } catch(e) {
            return e;
        }
    }

    // Test 5: Using throwUnless
    fun testThrowUnless(x: Int) : Int {
        try {
            throwUnless(505, x > 10);
            return x - 5;
        } catch(e) {
            return e;
        }
    }

    // Test 6: Catch block discarding error code using underscore
    fun testDiscardCatch(x: Int) : Int {
        try {
            if (x == 1) { throw(707); }
            return x;
        } catch(_) {
            return 999;
        }
    }

    // Test 7: Early return inside try block
    fun testReturnInsideTry() : Int {
        try {
            return 42;
            // unreachable code omitted intentionally
        } catch(e) {
            return e;
        }
    }

    // State variable for receiver-level tests
    v: Int;

    // Initialize state
    init() {
        self.v = 0;
    }

    // Test 8: Receiver-level control flow with early exit
    receive() {
        try {
            if (sender() == myAddress()) {
                self.v = 111;
                return;
            }
            { throw(888); }
        } catch(e) {
            self.v = e;
        }
    }

    // Test 9: Receiver-level nested try-catch in message handling
    receive("nested") {
        try {
            try {
                { throw(555); }
            } catch(e1) {
                if (e1 == 555) { throw(666); }
                return;
            }
        } catch(e2) {
            self.v = e2;
        }
    }

    // Test 10: Function with complex control flow: multiple nested try-catch and returns
    fun testComplex(x: Int) : Int {
        try {
            if (x > 100) { return x - 100; }
            try {
                if (x == 50) { throw(777); }
                return x * 2;
            } catch(inner) {
                if (inner == 777) { throw(888); } else { return inner + 1; }
            }
        } catch(outer) {
            return outer + 5;
        }
    }
}
