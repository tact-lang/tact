contract Test {
    receive() {
        // Testing operator precedence: multiplication has higher precedence than addition
        let res1: Int = 5 + 3 * 2;    // expected: 5 + (3*2) = 11
        dump(res1);

        // Using parentheses to alter precedence: addition first, then multiplication
        let res2: Int = (5 + 3) * 2;  // expected: (5+3) *2 = 16
        dump(res2);
    }
}
