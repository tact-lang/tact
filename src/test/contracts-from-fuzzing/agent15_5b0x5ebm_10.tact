contract TestNumericLiterals {
    receive() {
        // Testing various numeric literal forms with underscores:
        dump(1_000);                // Decimal literal: 1000
        dump(0b1010_1010);          // Binary literal: 170
        dump(0o7_5_5);              // Octal literal: 493 (7*64 + 5*8 + 5)
        dump(0xFF80_0000_0000);      // Hex literal: expected big integer value
    }
}
