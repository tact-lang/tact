contract TestPersistentRange(
    oneByte: Int as uint8
) {
    // The contract state variable oneByte expects values from -128 to 127
    receive() {
        // Try assigning an out-of-range value. According to the docs, this should eventually cause an error with exit code 5 after the compute phase.
        try {
            self.oneByte = 500; // 500 is outside the valid range for uint8 (-128..127)
        } catch (exitCode) {
            dump(exitCode); // expected to dump exit code 5
        }
        cashback(sender());
    }
}
