contract TestBitwiseShift {
    receive() {
        let a: Int = 1 << 2; // Expected 4
        let b: Int = 8 >> 1; // Expected 4
    }
}
