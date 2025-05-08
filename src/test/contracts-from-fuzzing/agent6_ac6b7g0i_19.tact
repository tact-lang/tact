contract TestPrecedenceMultiplicative {
    receive() {
        // Testing operator precedence: multiplication has higher precedence than addition
        // Expected: 2 + (3 * 4) = 14
        let r1: Int = 2 + 3 * 4;
        // Expected: (2 + 3) * 4 = 20
        let r2: Int = (2 + 3) * 4;
        dump(r1);
        dump(r2);
    }
}
