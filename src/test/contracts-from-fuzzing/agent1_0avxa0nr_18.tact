contract ControlFlowTest {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Function that increments counter using a repeat loop
    fun testLoop(n: Int) {
        // n must be in 1..2^31-1, so we assume valid n
        repeat (n) {
            self.counter = self.counter + 1;
        }
    }

    // Function that uses throwUnless: it throws exit code 101 if x is not 50
    fun testThrow(x: Int) {
        throwUnless(101, x == 50);
        self.counter = self.counter + x;
    }

    // Function that nests try...catch blocks and uses throwIf
    fun nestedTry(x: Int) : Int {
        try {
            // If x is zero, this will throw using explicit throw
            if (x == 0) {
                throw(202);
            }
            let y = 100 / x; // May throw division by zero if x is 0, but we check above
            try {
                // If y is less than 50, throw exit code 303
                throwIf(303, y < 50);
                return y;
            } catch (eInner) {
                // Return inner error code + 10
                return eInner + 10;
            }
        } catch (eOuter) {
            // Return outer error code + 20
            return eOuter + 20;
        }
    }
}
