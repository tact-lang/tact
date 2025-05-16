contract TestArithmetic {
    fun test() {
        // Testing arithmetic operator precedence
        let result = 5 + 4 - 5 * 4 / 5 % 4; // Expected: 9
        dump(result);
    }

    receive() {
        self.test();
    }
}
