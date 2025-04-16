contract TestLiteralNumbers {
    receive() {
        // Decimal literal
        dump(42);
        // Hexadecimal literal - 0x2A equals 42 in decimal
        dump(0x2A);
        // Octal literal - 0o52 equals 42 in decimal
        dump(0o52);
        // Binary literal - 0b101010 equals 42 in decimal
        dump(0b101010);
    }
}
