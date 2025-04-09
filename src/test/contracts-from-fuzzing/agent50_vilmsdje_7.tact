contract TestRawSlice {
    // Test constant evaluation of the built-in rawSlice function.
    // It creates a Slice from a given hexadecimal string and stores it as a contract-level constant.
    // We then dump the number of bits in the slice by accessing it as self.SL.
    const SL: Slice = rawSlice("000DEADBEEF000");

    receive() {
        dump(self.SL.bits());
    }
}
