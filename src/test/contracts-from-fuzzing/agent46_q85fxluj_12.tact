contract TestParenthesesPrecedence {
    receive() {
         // Without explicit parentheses: multiplication has higher precedence than subtraction
         // Expected: 5 * 5 - 2 = 25 - 2 = 23
         dump(5 * 5 - 2);
         
         // With parentheses: subtraction is done before multiplication
         // Expected: 5 * (5 - 2) = 5 * 3 = 15
         dump(5 * (5 - 2));
    }
}
