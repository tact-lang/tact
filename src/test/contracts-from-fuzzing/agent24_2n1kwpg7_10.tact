contract TestPrecedence {
    receive() {
        // Binary operator precedence: multiplication over addition
        let a: Int = 1 + 2 * 3;    // expected 7
        let b: Int = (1 + 2) * 3;    // expected 9
        // Ternary operator test
        let c: Int = false ? 1 : (false ? 3 : 4); // expected: 4
    }
}
