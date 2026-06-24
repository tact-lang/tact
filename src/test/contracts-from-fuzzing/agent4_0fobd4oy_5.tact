contract StringLiteralTest {
    fun testStr() {
        // A string literal with escape sequences and unicode escapes
        let s: String = "Hello, World! \n \t \u{1F600}";
        dump(s);
    }
    
    receive() {
        self.testStr();
    }
}
