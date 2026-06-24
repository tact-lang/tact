contract Playground {
    receive("plays") {
        // Ternary operator: condition ? expr_if_true : expr_if_false
        dump(true ? 100 : 200);   // Expected: 100
        dump(false ? 100 : 200);  // Expected: 200

        // Parenthesized expressions and precedence
        dump((((3) + (4)) * (2))); // Expected: (3 + 4) * 2 = 14
    }
}
