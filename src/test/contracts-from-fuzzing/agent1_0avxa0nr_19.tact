contract LoopEdgeTest {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Function that attempts a repeat loop with 0 iterations
    fun repeatZero() {
        // According to documentation, if the number of iterations is 0 the loop is not executed
        repeat (0) {
            self.counter = self.counter + 1;
        }
    }

    // Function that attempts a repeat loop with a negative number of iterations
    fun repeatNegative() {
        // Negative values should be ignored and the loop body not executed
        repeat (-5) {
            self.counter = self.counter + 1;
        }
    }

    get fun getCounter(): Int {
        return self.counter;
    }
}
