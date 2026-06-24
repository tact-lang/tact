contract TestOperatorPrecedence {
    receive() {
        // Testing operator precedence: multiplication has higher precedence than addition
        dump(1 + 2 * 3); // Expected output: 7
    }
}
