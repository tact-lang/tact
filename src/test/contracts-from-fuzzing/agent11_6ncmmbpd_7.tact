contract Test {
    receive() {
        // Test unary bitwise NOT operator: ~
        let a: Int = ~0;      // expected: -1
        let b: Int = ~(~0);   // expected: 0
        dump(a);
        dump(b);
    }
}
