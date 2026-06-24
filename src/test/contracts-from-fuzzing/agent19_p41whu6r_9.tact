contract TestArithmeticPrecedence() {
    fun test() {
        // Testing operator precedence and associativity
        // Expression: 5 + 4 - 5 * 4 / 5 % 4 should evaluate to 9 as per documentation
        let res = 5 + 4 - 5 * 4 / 5 % 4;
        dump(res);
    }

    receive() {
        self.test();
    }
}
