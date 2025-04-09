contract TestRawSlice() {
    // Test compile-time evaluation of rawSlice
    // rawSlice takes a hex string and converts it to a Slice at compile-time
    const S: Slice = rawSlice("000DEADBEEF000");

    receive() {
        // Dump the number of bits in the Slice S
        // This helps verify that rawSlice has been correctly evaluated at compile-time
        dump(self.S.bits());
        cashback(sender());
    }
}
