contract TestRawSlice() {
    // Test constant evaluation for the compile-time function rawSlice
    // Using a sample hex string
    const R: Slice = rawSlice("000DEADBEEF000");

    receive() {
        // Check that the produced slice has a non-zero bit length
        require(self.R.bits() > 0, "rawSlice constant produced an empty slice");
        cashback(sender());
    }
}
