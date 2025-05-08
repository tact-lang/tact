contract TestControlFlow {

    // Function-level control flow: simple return statement
    fun simpleReturn(): Int {
        return 42;
    }

    // Function-level: return with unreachable code after return (unreachable code is commented out)
    fun unreachableCode(): Int {
        return 1;
        // let a: Int = 2;
        // return a;
    }

    // Function-level: try-catch basic usage returning an Int
    fun tryCatchBasic(): Int {
        try {
            throw(101);
            // Unreachable
            // return 10;
        } catch (err) {
            return err; // capture exit code 101
        }
    }

    // Function-level: nested try-catch with an early return inside the inner catch
    fun nestedTryCatch(): Int {
        try {
            try {
                throw(111);
            } catch (innerErr) {
                return innerErr;
            }
        } catch (outerErr) {
            return outerErr;
        }
    }

    // Function-level: try with throwIf usage
    fun tryThrowIf(): Int {
        try {
            // This will throw because condition is true
            throwIf(202, true);
            // In case throwIf doesn't throw (shouldn't happen), return a default value
            return 999;
        } catch (err) {
            return err;
        }
    }

    // Function-level: return statement inside try block
    fun returnInTry(): Int {
        try {
            return 77;
        } catch (_) {
            return 0;
        }
    }

    /////////////////////////
    // Receiver-level tests
    /////////////////////////

    // A receive block with an early exit
    receive() {
        // Early exit based on a condition
        if (true) {
            return;
        }
        // This branch would not execute
        try {
            throw(303);
        } catch (err) {
            // error handling in receiver
        }
    }

    // A second receive block with a selector to simulate complex branching
    receive("complex") {
        // Branching logic with nested try-catch
        if (1 + 1 == 2) {
            try {
                if (false) {
                    throw(404);
                } else {
                    return;
                }
            } catch (e) {
                // Fallback branch if an error occurred
            }
        }
        // Additional message processing could occur here
    }
}
