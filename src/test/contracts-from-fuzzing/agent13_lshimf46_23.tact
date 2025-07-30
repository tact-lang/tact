contract TestBinaryPrecedence {
    receive() {
        // Mixed arithmetic operations with operator precedence:
        // Calculation: 1 + 2 * 3 - (4 / 2) % 3
        // 2 * 3 = 6, 4 / 2 = 2, 2 % 3 = 2, then 1 + 6 - 2 = 5
        let result: Int = 1 + 2 * 3 - 4 / 2 % 3;
        dump(result); // Expected output: 5
    }
}
