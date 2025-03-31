contract ControlFlowEdge {
    x: Int;

    init() {
        self.x = 0;
    }

    // Function that mixes nested try-catch and state modification
    fun mixedFlow() : Int {
        self.x = 5;
        try {
            try {
                if (self.x == 5) {
                    throw(20);
                }
                return 100; // This line is unreachable
            } catch (inner) {
                // Catch inner error and update state: 5 + 20 = 25
                self.x = self.x + inner;
                return self.x; // Expected to return 25
            }
        } catch (outer) {
            // Not expected to be reached
            return outer;
        }
    }

    // Function that performs a loop with nested try-catch and early return
    fun loopNestedFlow() : Int {
        self.x = 0;
        repeat (4) {
            try {
                if (self.x == 2) {
                    return self.x; // Early exit when x equals 2
                }
                self.x = self.x + 1;
            } catch (e) {
                // No error expected; this block is for demonstration
                self.x = self.x;
            }
        }
        return self.x; // Expected to be 4 if not returned early
    }

    // Receiver-level control flow test
    receive("edge") {
        try {
            if (self.x == 0) {
                throw(50);
            }
            return;
        } catch (e) {
            // Update state transiently; since receiver modifications are not persisted
            self.x = e + 5; // Expected to set x to 55 if thrown, though not persisted
        }
    }
}
