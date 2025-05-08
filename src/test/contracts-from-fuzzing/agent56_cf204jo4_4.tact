contract TestSHA256 {
    // Constant sha256 computed at compile-time
    // The exact numeric value depends on the sha256 algorithm implementation,
    // but this test ensures that the compile-time evaluation works and the result is inlined.
    const H: Int = sha256("hello world");

    fun run() {
        dump(self.H);
    }

    receive() {
        self.run();
        cashback(sender());
    }
}
