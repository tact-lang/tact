contract Test {
    receive() {
        // Testing arithmetic operator precedence
        dump(1 + 2 * 3);   // Expected: 1 + (2*3) = 7
        dump((1 + 2) * 3); // Expected: (1+2)*3 = 9
    }
}
