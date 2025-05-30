contract TestComplexExpr {
    receive() {
        // A complex expression combining arithmetic and parentheses
        let expr: Int = (5 + 2) * (3 - 1) / (1 + 1); // Expected: ((7) * (2)) / (2) = 14 / 2 = 7
    }
}
