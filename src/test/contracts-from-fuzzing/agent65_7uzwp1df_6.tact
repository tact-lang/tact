contract BinaryExprTest {
    receive() {
        // Test operator precedence
        let a: Int = 2 + 3 * 4;           // Expected: 2 + (3*4) = 14
        let b: Int = (2 + 3) * 4;         // Expected: 5 * 4 = 20
        let c: Int = 10 - 2 - 3;          // Expected: (10 - 2) - 3 = 5

        // Test division and modulus
        let d: Int = 20 / 3;              // Integer division: 6
        let e: Int = 20 % 3;              // Remainder: 2

        dump(a);
        dump(b);
        dump(c);
        dump(d);
        dump(e);
    }
}
