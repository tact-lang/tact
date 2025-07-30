contract TestOperatorPrecedence {
    receive() {
        // Without parentheses, multiplication has higher precedence
        let a: Int = 1 + 2 * 3; // should be 1 + (2*3) = 7
        // With parentheses, addition happens first
        let b: Int = (1 + 2) * 3; // should be 9
    }
}
