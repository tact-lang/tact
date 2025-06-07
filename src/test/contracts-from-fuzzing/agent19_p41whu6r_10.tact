contract TestIntegerLiterals() {
    fun test() {
        // Testing various integer literal notations
        dump(0);         // decimal 0
        dump(42);        // decimal 42
        dump(1_000);     // decimal with underscore
        dump(0xABC);     // hexadecimal
        dump(0xf);       // hexadecimal lowercase
        dump(0o777);     // octal
        dump(0b101010);  // binary (42 in decimal)
    }

    receive() {
        self.test();
    }
}
