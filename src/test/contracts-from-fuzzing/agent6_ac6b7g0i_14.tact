contract TestBinaryBitwise {
    receive() {
        // Bitwise OR operation on integers
        let x: Int = 3 | 1;  // Expected: 3, since 3 in binary is 11 and 1 is 01, OR=11
        dump(x);
    }
}
