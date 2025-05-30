contract TestExpressions {
    fun showcase() {
        // Testing arithmetic expression precedence: 5 + 4 - 5 * 4 / 5 % 4. According to documentation, expected result is 9.
        let result = 5 + 4 - 5 * 4 / 5 % 4;
        dump(result);
    }

    receive() {
        self.showcase();
    }
}