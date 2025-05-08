contract TestArithmetic() {
    fun test() {
        // Testing arithmetic operator precedence: multiplication has higher precedence than addition
        // Expected result: 5 + (2 * 3) = 11
        dump(5 + 2 * 3);
    }
    receive() {
        self.test();
    }
}
