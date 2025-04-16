contract TestModulo {
    fun test() {
        // Testing modulo operator, including negative divisor
        // According to docs:
        // 1 % 5 should produce 1
        // 1 % -5 should produce -4
        let r1 = 1 % 5;
        let r2 = 1 % -5;
        dump(r1);  // expected: 1
        dump(r2);  // expected: -4
    }

    receive() {
        self.test();
    }
}
