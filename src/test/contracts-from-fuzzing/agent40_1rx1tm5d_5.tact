contract TestPrecedence {
    receive() {
        // Testing operator precedence with parentheses
        dump((1 + 2) * 3); // expected result: 9
        dump(1 + 2 * 3);   // expected result: 7
    }
}
