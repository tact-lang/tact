contract TestBitwiseOperators {
    receive() {
        // Test bitwise operators
        let a: Int = 255 & 15;    // expected 15
        let b: Int = 255 | 0;       // expected 255
        let c: Int = 2 ^ 3;         // expected 1
        let d: Int = ~42;           // expected -43
    }
}
