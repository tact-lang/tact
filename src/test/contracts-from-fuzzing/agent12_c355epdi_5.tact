contract ArithmeticTest {
    receive() {
        // Test binary arithmetic operators and operator precedence
        // Expected: 1 + (2*3) - (4/2) = 1 + 6 - 2 = 5
        let a: Int = 1 + 2 * 3 - 4 / 2;
        dump(a);
    }
}
