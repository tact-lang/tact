contract TestBinaryArithmetic {
    receive() {
        // Test binary arithmetic operators
        let mult: Int = 6 * 7;   // Expected 42
        let sub:  Int = 10 - 3;  // Expected 7
        let div:  Int = 20 / 4;  // Expected 5
        let mod:  Int = 17 % 3;  // Expected 2
    }
}
