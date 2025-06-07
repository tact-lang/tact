contract Playground {
    receive("plays") {
        // Testing binary arithmetic operator precedence
        // Without parentheses: multiplication has higher precedence
        dump(2 + 3 * 4);   // Expected: 2 + (3 * 4) = 14
        // With parentheses: addition first
        dump((2 + 3) * 4); // Expected: (2 + 3) * 4 = 20
    }
}
