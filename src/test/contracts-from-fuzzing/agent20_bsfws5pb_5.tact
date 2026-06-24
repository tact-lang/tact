contract Test {
    receive() {
        // Test unary tilde operator (bitwise NOT)
        let a: Int = 42;
        let not_a: Int = ~a;      // expected: -43
        let double_not_a: Int = ~(~a); // should be 42
        dump(not_a);
        dump(double_not_a);
    }
}
