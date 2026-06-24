contract TestUnaryOperators {
    receive() {
        // Testing unary minus combined with a nested addition expression.
        let negResult: Int = -(5 + 3);  // expected: -8
    }
}
