contract ArithmeticOperatorsTest {
    fun test() {
        // Testing modulo operator behavior:
        // According to documentation: 1 % 5 should be 1, and 1 % -5 should be -4
        let a = 1 % 5;   // Expected: 1
        let b = 1 % -5;  // Expected: -4
        dump(a);
        dump(b);
    }

    receive() {
        self.test();
    }
}
