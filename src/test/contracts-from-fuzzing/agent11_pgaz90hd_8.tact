contract TestTonZero() {
    // Constant computed at compile-time using ton built-in function with input "0"
    // Expected value: 0
    const ZERO: Int = ton("0");

    receive() {
        dump(self.ZERO);
    }
}
