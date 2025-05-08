contract TestBinaryArithmetic {
    // Testing binary arithmetic expressions
    receive() {
        // Addition
        let add: Int = 5 + 3;           // expected 8
        // Subtraction
        let sub: Int = 7 - 2;           // expected 5
        // Multiplication
        let mul: Int = 4 * 2;           // expected 8
        // Division (truncated)
        let div: Int = 8 / 3;           // expected 2 (8/3 = 2.666 -> truncated to 2)
        // Modulo
        let mod: Int = 8 % 3;           // expected 2
    }
}
