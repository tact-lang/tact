contract TestArithmeticPrecedence {
    receive() {
        // Testing default arithmetic operator precedence
        // 1 + (2 * 3) - (4 / 2) => 1 + 6 - 2 = 5
        let a: Int = 1 + 2 * 3 - 4 / 2;

        // Using parentheses to override precedence
        // ((1 + 2) * (3 - 4)) / 2 => (3 * (-1)) / 2 = -3 / 2 (truncated toward zero) = -1
        let b: Int = (1 + 2) * (3 - 4) / 2;
    }
}
