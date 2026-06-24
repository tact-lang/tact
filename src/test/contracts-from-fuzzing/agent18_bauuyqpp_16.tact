contract TestNumericLiterals {
    fun showcase() {
        // Decimal literal
        dump(42); // expected output: 42

        // Hexadecimal literal
        dump(0xFF); // expected output: 255

        // Octal literal
        dump(0o755); // expected output: 493

        // Binary literal
        dump(0b101010); // expected output: 42

        // Underscore separated number (decimal)
        dump(1_000_000); // expected output: 1000000
    }
}
