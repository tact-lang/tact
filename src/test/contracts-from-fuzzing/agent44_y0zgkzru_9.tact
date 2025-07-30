contract TestTonNegative {
    // Test constant evaluation for ton() with a negative value
    // Expected: The compiler should produce an error because negative amounts are not allowed
    const TON_NEG: Int = ton("-1");

    receive() {
         dump(self.TON_NEG);
    }
}
