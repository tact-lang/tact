contract TestOperatorPrecedence {
    // This contract tests arithmetic operator precedence as per documentation
    receive() {
        // According to documentation, multiplication has higher precedence than addition
        // Expected: 1 + 2 * 3 = 1 + (2*3) = 7
        let result: Int = 1 + 2 * 3;
        dump(result); // should dump 7
    }
}
