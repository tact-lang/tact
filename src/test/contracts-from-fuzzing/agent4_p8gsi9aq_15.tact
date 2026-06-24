contract TestParenthesesPrecedence {
    receive() {
        // Testing operator precedence between '+' and '*'
        let a: Int = 2 + 3 * 4;    // expected: 2 + (3*4) = 14
        let b: Int = (2 + 3) * 4;  // expected: (2+3) * 4 = 20
        let c: Int = 2 + (3 * 4);  // redundant parentheses; should be 14
        
        // Testing left-associativity in subtraction: (10 - 2) - 3 = 5
        let d: Int = 10 - 2 - 3;   
    }
}
