contract TestRawSlice() {
    // Use rawSlice compile-time function to create a Slice from a hex string literal
    // The constant RS is computed at compile time
    const RS: Slice = rawSlice("000DEADBEEF000");

    fun test() {
        // Dump the number of bits stored in RS for verification
        dump(self.RS.bits());
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
