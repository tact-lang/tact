contract TestNonEightBits {
    receive() {
        // Attempt to create a String from a Slice that has a non-multiple-of-8 bit length using rawSlice bit-padded syntax
        // The hex "41_" represents 0x41 in bit-padded mode, which yields 6 bits instead of 8
        let s: String = rawSlice("41_").asString();
    }
}
