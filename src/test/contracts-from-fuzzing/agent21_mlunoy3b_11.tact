contract TestPrecedence {
    receive() {
        // Testing parenthesized expressions and operator precedence
        // Without parentheses: multiplication has higher precedence than addition
        let expr1: Int = 1 + 2 * 3; // Expected: 1 + (2*3) = 7
        
        // With parentheses: addition is computed first
        let expr2: Int = (1 + 2) * 3; // Expected: (1+2) * 3 = 9
        
        // Logical operators with explicit grouping
        let expr3: Bool = (true && false) || (!false); // Expected: (false) || (true) = true
        
        // Ternary conditional expression
        let result: String = (expr1 == 7) ? "Correct" : "Incorrect"; // Expected: "Correct"
        
        return;
    }
}
