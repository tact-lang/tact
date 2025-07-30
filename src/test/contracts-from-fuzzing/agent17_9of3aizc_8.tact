contract ConstRawSliceTest() {
    // Testing compile-time evaluation of rawSlice() built-in with a valid hex string
    const raw_val: Slice = rawSlice("000DEADBEEF000");

    receive() {
        let rs: Slice = self.raw_val;
        cashback(sender());
    }
}
