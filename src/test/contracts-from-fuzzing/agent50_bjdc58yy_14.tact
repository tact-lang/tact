contract TestParentheses {
    receive() {
        dump(5 * (5 - 2));   // expected: 15
        dump((5 * 5) - 2);     // expected: 23
    }
}
