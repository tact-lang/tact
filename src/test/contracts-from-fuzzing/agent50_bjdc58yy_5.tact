contract TestIntegerLiterals {
    receive() {
        // Decimal literals
        dump(0);
        dump(42);
        dump(1_000);
        dump(020); // still decimal, not octal

        // Hexadecimal literal
        dump(0xABC);

        // Octal literal
        dump(0o777);

        // Binary literal
        dump(0b1010);
    }
}
