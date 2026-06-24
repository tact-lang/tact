contract TestPrecedenceAndTernary {
    receive() {
        // Test parenthesized expressions and operator precedence
        let without_parens: Int = 5 * 5 - 2;    // expected 23
        let with_parens: Int = 5 * (5 - 2);       // expected 15

        // Test ternary operator expression
        let ternary: Int = 2 + 2 == 4 ? 10 : 20;    // expected 10

        // Test nested ternary without extra parentheses on alternative cases
        // According to the spec, this should be parsed correctly as: false ? 1 : (false ? 2 : 3)
        let nested: Int = false ? 1 : false ? 2 : 3; // expected 3
    }
}
