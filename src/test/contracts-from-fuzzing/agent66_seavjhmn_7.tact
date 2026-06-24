contract TestParenthesisPrecedence {
    receive() {
        // Expression: 1 + (2 * 3) - 4 / (2 + 2)
        // Expected result: 1 + 6 - 1 = 6
        let result: Int = 1 + (2 * 3) - 4 / (2 + 2);
        dump(result);
    }
}
