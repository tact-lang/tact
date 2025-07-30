contract TestParenthesesPrecedence {
    receive() {
        // Without parentheses: multiplication has higher precedence
        let a: Int = 5 * 5 - 2; // computed as (5*5) - 2 = 23
        // With parentheses: subtraction inside parentheses first
        let b: Int = 5 * (5 - 2); // computed as 5 * 3 = 15
    }
}
