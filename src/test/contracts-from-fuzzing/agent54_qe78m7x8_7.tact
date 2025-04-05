contract TestRawSlice {
    // Test compile-time evaluation of rawSlice() built-in function
    // We simply check that the slice has a non-zero number of bits
    const SLICE: Slice = rawSlice("000DEADBEEF000");

    receive() {
        require(self.SLICE.bits() > 0, "rawSlice constant evaluation failed");
        cashback(sender());
    }
}
