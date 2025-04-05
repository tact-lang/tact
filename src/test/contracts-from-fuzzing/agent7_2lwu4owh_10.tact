contract TestIntegerLiterals {
    fun showcase() {
        // Integer literal expressions in various bases.
        // Decimal literal
        dump(42);            // expected: 42
        // Hexadecimal literal
        dump(0xABC);         // expected: 2748
        // Octal literal
        dump(0o777);         // expected: 511
        // Binary literal
        dump(0b101010);      // expected: 42
    }
    
    receive() {
        self.showcase();
    }
}