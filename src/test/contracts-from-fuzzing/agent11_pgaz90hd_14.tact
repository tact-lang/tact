contract TestRawSlice() {
    // Testing rawSlice built-in function with bit-padded input. According to documentation:
    // rawSlice("4a_").loadUint(6) should yield 18 (binary 10010)
    
    receive() {
        let s: Slice = rawSlice("4a_");
        let value: Int = s.loadUint(6);
        dump(value); // Expected output: 18
    }
}
