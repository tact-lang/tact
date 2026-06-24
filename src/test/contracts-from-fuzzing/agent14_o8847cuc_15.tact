contract TestRawSlice {
    receive() {
        // Using rawSlice with bit-padding. According to docs, rawSlice("4a_") should produce a slice
        // where loadUint(6) equals 18 (binary 10010).
        let s: Slice = rawSlice("4a_");
        let v: Int = s.loadUint(6);
        require(v == 18, "rawSlice bit-padded evaluation failed: expected 18");
    }
}
