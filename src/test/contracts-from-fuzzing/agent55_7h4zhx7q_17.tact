contract TestPrecedence {
    receive() {
        // Without parentheses: multiplication has higher precedence
        dump(5 * 5 - 2); // expected result: 23
        // With parentheses: addition inside parentheses first
        dump(5 * (5 - 2)); // expected result: 15
    }
}
