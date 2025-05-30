contract TestReturn {
    // Simple function-level control flow: normal return in a pure function
    fun pureReturn(x: Int): Int {
        return x + 1;
    }

    // Try-catch returning a value based on input
    fun tryCatchReturn(x: Int): Int {
        try {
            if (x == 0) { throw(100); }
            return x * 2;
        } catch (e) {
            return -1;
        }
    }

    // Nested try-catch with return inside the inner catch
    fun nestedTry(x: Int): Int {
        try {
            try {
                if (x < 0) { throw(200); }
                return x;
            } catch (e) {
                return e + 10;
            }
        } catch (outer) {
            return 0;
        }
    }

    // Loop with try block and early return from inside try
    fun loopTry(x: Int): Int {
        repeat (3) {
            try {
                if (x == 1) { return 100; }
            } catch (e) {
                // No-op in catch
            }
        }
        return x;
    }

    // Function with return in catch clause
    fun returnInCatch(x: Int): Int {
        try {
            if (x == 5) { throw(55); }
            return x;
        } catch (e) {
            return e + 1;
        }
    }

    // Function demonstrating return inside a loop inside a try
    fun returnInLoop(): Int {
        try {
            repeat(5) {
                { return 42; }
            }
            return -1; // should be unreachable
        } catch (_) {
            return 0;
        }
    }

    // Function that unconditionally throws (unhandled exception), without unreachable code
    fun unhandled(): Int {
         throw(999);
    }

    // Function with try-catch where catch itself throws
    fun throwInCatch(): Int {
        try {
            throw(10);
        } catch (e) {
            throw(e + 20);
        }
    }
}

// Receiver-level control flow test
contract TestReceiver {
    // Initialize v with a default value
    v: Int = 0;

    // Message handling with try-catch and return
    receive("msg") {
        try {
            if (self.v > 0) { return; } else { throw(50); }
        } catch (e) {
            self.v = e;
        }
    }

    // Nested try-catch inside receiver: return in inner catch
    receive("action") {
        try {
            try {
                if (self.v == 10) { throw(1000); }
                return;
            } catch (err) {
                self.v = err;
                return;
            }
        } catch (_) {
            self.v = -1;
        }
    }
}
