contract ExprTest {
    fun fuzzEx() {
        let five: Int = 5;
        let four: Int = 4;
        // Evaluate expression: 5 + 4 - 5 * 4 / 5 % 4
        // Calculation: 5 * 4 = 20, then 20 / 5 = 4, then 4 % 4 = 0, so result = 5 + 4 - 0 = 9
        let result: Int = five + four - five * four / five % four;
        dump(result);
    }

    receive() {
        self.fuzzEx();
    }
}
