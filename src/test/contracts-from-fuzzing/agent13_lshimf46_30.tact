contract TestBitwiseNot {
    receive() {
        // Test the unary bitwise NOT operator (~)
        let a: Int = ~42; // expected: bitwise inversion of 42
        dump(a);
    }
}
