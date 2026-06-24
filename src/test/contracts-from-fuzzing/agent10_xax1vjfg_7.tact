contract TestParenthesesPrecedence {
    receive() {
        // Without parentheses: 5 * 5 - 2 should be evaluated as (5 * 5) - 2 = 23
        dump(5 * 5 - 2);
        // With parentheses: 5 * (5 - 2) = 15
        dump(5 * (5 - 2));
    }
}