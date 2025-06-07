contract TestPrecedence {
    receive() {
        // Testing operator precedence without and with parentheses
        let x: Int = 2 + 3 * 4;    // expected 2 + (3*4) = 14
        let y: Int = (2 + 3) * 4;  // expected (2+3)*4 = 20
        let z: Int = -(2 + 3);     // expected -5
    }
}
