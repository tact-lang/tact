contract Test {
    receive() {
        // Test bitwise right shift on negative number
        // According to documentation, sign-propagating right shift should preserve sign
        // -4 in binary (two's complement) shifted right by 1 should be -2
        dump(-4 >> 1);
    }
}
