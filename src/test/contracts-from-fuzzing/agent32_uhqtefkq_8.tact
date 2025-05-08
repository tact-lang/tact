contract LiteralsTest() {
    fun testLiterals(): Int {
         let a = 1_000_000;          // decimal with underscore
         let b = 0b1_0101;           // binary literal, expected value: 21
         let c = 0o755;              // octal literal, expected value: 493
         let d = 0xFF_AA;            // hexadecimal literal, expected value: 65450
         return a + b + c + d;       // expected: 1,000,000 + 21 + 493 + 65450 = 1,066, - actually let's compute: 1,000,000 + 21 = 1,000,021, then +493 = 1,000,514, then +65450 = 1,065, - recalc: 1,000,514 + 65,450 = 1,065,964
    }

    receive() {
         dump(self.testLiterals());
         cashback(sender());
    }
}
