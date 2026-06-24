contract TestRawSlice() {
    receive() {
        // rawSlice returns a Slice. Let's check the number of bits in it.
        // The expected result depends on the provided hex. For this test, we simply dump the bit length.
        let s: Slice = rawSlice("000DEADBEEF000");
        dump(s.bits());
    }
}
