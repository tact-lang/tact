contract TestRawSlice() {
    // Test constant evaluation of rawSlice built-in compile-time function.
    // The rawSlice function takes a hex string and converts it to a Slice.
    // We define a contract-level constant SL.
    const SL: Slice = rawSlice("000DEADBEEF000");

    fun showcase() {
        // Dump the number of bits contained in the Slice
        dump(self.SL.bits());
    }

    receive() {
        self.showcase();
        return;
    }
}
