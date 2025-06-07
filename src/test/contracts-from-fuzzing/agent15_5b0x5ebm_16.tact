contract TestUnaryOps {
    receive() {
        let a = 5;
        // Test unary negation and bitwise NOT operations
        dump(-a);       // Expected: -5
        dump(~a);       // Expected: -6
        dump(-(~a));    // Expected: 6
        dump(~(-a));    // Expected: 4
    }
}
