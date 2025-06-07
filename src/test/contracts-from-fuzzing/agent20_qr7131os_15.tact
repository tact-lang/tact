contract TestArithmeticPrecedence {
    receive() {
        // Test operator precedence without parentheses (multiplication has higher precedence)
        let a: Int = 1 + 2 * 3; // expected: 1 + (2 * 3) = 7
        dump(a);
        
        // Test grouping with parentheses overriding precedence
        let b: Int = (1 + 2) * 3; // expected: (1 + 2) * 3 = 9
        dump(b);
    }
}
