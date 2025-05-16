contract TestTon() {
    // Compile-time evaluation of ton() constant
    // Expected: ton("1") evaluates to 1000000000
    const T: Int = ton("1");

    receive() {
        // Dumping the constant at runtime to verify its value
        dump(self.T);
    }
}
