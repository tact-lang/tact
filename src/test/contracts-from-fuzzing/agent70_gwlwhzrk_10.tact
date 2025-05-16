contract Test {
    receive() {
         // Testing parenthesized expressions and operator precedence
         // Without parentheses: 1 + 2 * 3 should be 7, with parentheses: (1 + 2) * 3 should be 9
         dump(1 + 2 * 3);     // Expect 7
         dump((1 + 2) * 3);   // Expect 9
    }
}
