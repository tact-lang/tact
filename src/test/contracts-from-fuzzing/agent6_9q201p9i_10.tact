contract TestRawSlice() {
    // Constant evaluated at compile-time using the rawSlice built-in function
    // According to the documentation, rawSlice("000DEADBEEF000") should produce a Slice with a specific bit-length
    const raw_slice: Slice = rawSlice("000DEADBEEF000");

    receive() {
        // Access the constant via self
        dump(self.raw_slice.bits());
        cashback(sender());
    }
}
