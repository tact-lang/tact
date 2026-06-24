contract TestIntegerLiterals() {
    fun test() {
        // Testing various integer literal expressions
        dump(0);              // expected: 0 (decimal)
        dump(42);             // expected: 42 (decimal)
        dump(1_000);          // expected: 1000 (decimal with underscores)
        dump(020);            // expected: 20 (decimal literal with leading zero)
        dump(0xABC);          // expected: 2748 (hexadecimal)
        dump(0xf);            // expected: 15 (hexadecimal)
        dump(0x001);          // expected: 1 (hexadecimal with leading zeros)
        dump(0o777);          // expected: 511 (octal)
        dump(0o00000001);     // expected: 1 (octal with leading zeros)
        dump(0b111010101111010); // expected: binary literal
    }
    receive() {
        self.test();
    }
}
