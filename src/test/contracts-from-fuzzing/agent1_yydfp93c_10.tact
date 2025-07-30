contract TestIntegerLiterals {
    // This function tests integer literal expressions in various bases and with underscore separators
    fun test_literals(): Int {
        let dec = 1_000;         // decimal literal
        let hex = 0xFF;           // hexadecimal literal (255)
        let oct = 0o77;           // octal literal (63)
        let bin = 0b1010;         // binary literal (10)
        return dec + hex + oct + bin; // Expected: 1000 + 255 + 63 + 10 = 1328
    }

    receive() {
        dump(self.test_literals());
    }
}
