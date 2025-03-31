contract ControlFlowTest {
    v: Int;

    // Initialize state variable v
    init() {
        self.v = 0;
    }

    // Test 1: Normal return inside a try block; should return 42
    fun testReturn() : Int {
        try {
            return 42;
        } catch (e) {
            return 0;
        }
    }

    // Test 2: Return inside a loop within a try block using the repeat loop; early exit returns 99
    fun testReturnLoop() : Int {
        try {
            repeat (3) {
                if (true) {
                    return 99;
                }
            }
            return 1; // Should not be reached
        } catch (e) {
            return -1;
        }
    }

    // Test 3: Nested try-catch: inner try throws an error, inner catch catches and returns inner_err + 1 (expecting 124)
    fun nestedTryCatch() : Int {
        try {
            try {
                throw(123);
            } catch (inner_err) {
                return inner_err + 1;
            }
        } catch (outer_err) {
            return outer_err + 10;
        }
    }

    // Test 4: A try block that returns immediately, making subsequent throw unreachable
    fun testReturnInTry() : Int {
        try {
            return 10;
        } catch (e) {
            return e + 5;
        }
    }

    // Test 5: Receiver-level control flow. When receiving message "handle", if self.v is 0, throw an error and catch it, modifying the state.
    // In a receiver context, modifications in try-catch are not persisted after execution.
    receive("handle") {
        try {
            if (self.v == 0) {
                throw(300);
            }
            return;
        } catch (e) {
            // Setting self.v; may affect state during execution but not persist after
            self.v = e;
        }
    }
}

// Additional tests outside the contract
fun standaloneReturnTest() : Int {
    try {
        return 7;
    } catch (e) {
        return 0;
    }
}

fun nestedReturnInCatch() : Int {
    try {
        throw(50);
    } catch (e) {
        return e * 2; // expect 100
    }
}
