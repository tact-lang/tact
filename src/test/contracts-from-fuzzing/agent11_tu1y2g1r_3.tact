contract TestLiterals {
    // This function tests integer literal expressions by dumping various forms:
    // Decimal: 0, 42, 1_000
    // Hexadecimal: 0xABC, 0xf, 0x001
    // Octal: 0o777, 0o00000001
    // Binary: 0b111010101111010
    fun test() {
        dump(0);
        dump(42);
        dump(1_000);
        dump(0xABC);
        dump(0xf);
        dump(0x001);
        dump(0o777);
        dump(0o00000001);
        dump(0b111010101111010);
    }

    receive() {
        self.test();
    }
}
