contract TestParentheses {
    receive() {
        // Parenthesized expressions and precedence
        dump((1 + 2) * (3 + 4)); // expected output: 21
        dump(1 + 2 * 3);         // expected output: 7
    }
}
