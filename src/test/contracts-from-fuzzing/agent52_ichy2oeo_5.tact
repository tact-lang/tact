contract TestPrecedence {
    receive() {
        // Testing operator precedence: multiplication before addition
        let a: Int = 1 + 2 * 3; // expected: 1 + (2*3) = 7
        let b: Int = (1 + 2) * 3; // expected: (1+2)*3 = 9
        // Compare results by a dummy check to ensure values are computed
        if (a == 7 && b == 9) {
            // do nothing
        } else {
            // This branch should never be reached if precedence works as documented
            throw(1);
        }
    }
}
