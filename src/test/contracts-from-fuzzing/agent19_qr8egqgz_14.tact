contract Test {
    receive() {
        // Testing rawSlice() with underscore bit-padding, as documented:
        // Not bit-padded: rawSlice("4a").loadUint(8) should yield 74 (binary 01001010)
        // Bit-padded: rawSlice("4a_").loadUint(6) should yield 18 (binary 010010 => 18)
        let v = rawSlice("4a_").loadUint(6);
    }
}
