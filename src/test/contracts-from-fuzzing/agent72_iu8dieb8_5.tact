contract TestUnaryOperators {
    // Testing unary operators: negation, bitwise NOT, and boolean inversion
    receive() {
        let a: Int = -(-1);      // Expected: 1
        let b: Int = ~42;         // Bitwise not of 42
        let c: Bool = !false;     // Expected: true
    }
}
