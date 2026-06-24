contract ControlFlow {
    // Tests control-flow using try-catch and returns in functions

    // Function-level control flow: If x > 10, returns x; otherwise, throws an error which is caught and returned
    fun testTryCatch(x: Int) : Int {
        try {
            if (x > 10) {
                return x;
            } else {
                throw(500);
            }
        } catch (e) {
            return e;
        }
    }

    // Nested try-catch: The inner try divides 10 by x unless x is 0, in which case it throws; errors are manipulated in catch blocks
    fun nestedTry(x: Int) : Int {
        try {
            try {
                if (x == 0) {
                    throw(101);
                } else {
                    return 10 / x;
                }
            } catch (inner) {
                // Add 1 to the inner error code
                return inner + 1;
            }
        } catch (outer) {
            // If an error escapes the inner try, add 2
            return outer + 2;
        }
    }

    // Chained control flow: Uses if-else to either return a computed value or throw an error, which is handled in catch
    fun chainTest(x: Int) : Int {
        try {
            if (x < 0) {
                throw(300);
            } else {
                return x * 2;
            }
        } catch (inner) {
            return inner + 100;
        }
    }

    // Branch-based control flow: Demonstrates conditional returns and nested if in the catch block
    fun branchTest(x: Int) : Int {
        try {
            if (x != 0) {
                return x;
            } else {
                throw(55);
            }
        } catch (e) {
            if (e == 55) {
                return 0;
            } else {
                return -1;
            }
        }
    }

    // Receiver-level control flow: A minimal receive handler with internal try-catch
    receive() {
        try {
            let a: Int = 1;
            let b: Int = 2;
            let c: Int = a + b; // simple arithmetic
            // Normally additional message processing could go here
        } catch (err) {
            // In case of any error, silently handle and exit the receive handler
            return;
        }
    }
}
