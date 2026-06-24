contract IntLiteralTest {
    fun testLiterals() {
        // Various integer literal expressions in different bases
        let dec: Int = 42;            // decimal 42
        let decUnderscore: Int = 1_000; // decimal 1000 with underscore
        let legacyDec: Int = 020;       // legacy style decimal literal, expected 20
        let hex: Int = 0xFF;            // hexadecimal, expected 255
        let bin: Int = 0b1010;          // binary, expected 10
        let decLarge: Int = 10_000_000; // large decimal literal with underscores
        
        dump(dec);
        dump(decUnderscore);
        dump(legacyDec);
        dump(hex);
        dump(bin);
        dump(decLarge);
    }

    receive() {
        self.testLiterals();
    }
}
