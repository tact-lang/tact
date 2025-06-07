contract TestComplexExpr {
    receive() {
        // Complex expression combining binary, unary, and parentheses
        // Calculation: (5 + -3) * (2 + ~0)
        // (5 + -3) = 2, ~0 should compute to -1, hence (2 + (-1)) = 1; product = 2
        let result: Int = (5 + -3) * (2 + ~0);
    }
}
