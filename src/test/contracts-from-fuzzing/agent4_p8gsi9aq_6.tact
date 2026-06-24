contract TestBinaryOperators {
    receive() {
        let sum: Int = 7 + 5;         // expected: 12
        let diff: Int = 7 - 5;          // expected: 2
        let product: Int = 7 * 5;       // expected: 35
        let quotient: Int = 7 / 5;      // expected: integer division result (1 or 1.4 truncated, likely 1)
        let orResult: Bool = false || true; // expected: true
    }
}
