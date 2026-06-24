contract LiteralTest {
    fun test(): Int {
        let dec: Int = 1_000;      // decimal literal using underscores
        let hex: Int = 0x3E8;       // hexadecimal literal for 1000
        return dec - hex;         // expected result: 0
    }

    receive() {
        self.test();
    }
}
