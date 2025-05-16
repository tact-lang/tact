contract ExprTest() {
    fun test() {
        // Evaluate an arithmetic expression: 1 + 2 * 3 - 4 / 2
        // Expected result: 1 + 6 - 2 = 5
        let a = 1 + 2 * 3 - 4 / 2;
        dump(a);
    }
    receive() {
        self.test();
    }
}
