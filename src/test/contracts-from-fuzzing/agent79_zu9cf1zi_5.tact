contract TestPrecedence {
    receive() {
        // Testing operator precedence: multiplication has higher precedence than addition
        let res: Int = 1 + 2 * 3; // Expected 1 + (2*3) = 7
        dump(res);
    }
}
