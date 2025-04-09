contract TestParenthesesPrecedence {
    receive() {
        // Without parentheses: multiplication has higher precedence than subtraction
        let res1: Int = 5 * 5 - 2; // expected 25 - 2 = 23
        
        // With parentheses: addition inside evaluated first
        let res2: Int = 5 * (5 - 2); // expected 5 * 3 = 15
    }
}
