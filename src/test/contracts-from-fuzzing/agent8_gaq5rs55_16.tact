contract ExprShortCircuit {
    // Persistent state variable to check side effects
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Function that performs a side-effect by incrementing the counter
    fun sideEffect() : Bool {
        self.counter = self.counter + 1;
        return true;
    }

    fun test() {
        // Reset counter to 0
        self.counter = 0;

        // Short-circuit with &&: false && sideEffect() should not call sideEffect()
        if (false && self.sideEffect()) { /* nothing */ }
        dump(self.counter); // expected output: 0

        // Short-circuit with ||: true || sideEffect() should not call sideEffect()
        if (true || self.sideEffect()) { /* nothing */ }
        dump(self.counter); // expected output: 0

        // Now non-short-circuited: true && sideEffect() should call sideEffect()
        if (true && self.sideEffect()) { /* nothing */ }
        dump(self.counter); // expected output: 1
    }

    receive() {
        self.test();
    }
}
