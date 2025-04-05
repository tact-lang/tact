contract TestParenthesizedExpressions {
    receive() {
        // Testing precedence and parentheses
        let a: Int = 5 * 5 - 2;   // should be 23
        let b: Int = 5 * (5 - 2);   // should be 15
        a + b;
    }
}
