contract TestPrecedence {
    receive() {
        // Testing operator precedence: multiplication has higher precedence than addition
        dump(2 + 3 * 4); // Expected: 14
    }
}
