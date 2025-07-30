contract StringTest {
    fun testStringLiterals() {
        let literal: String = "A string literal";
        let escaped: String = "This is a newline character: \n";
        let quote: String = "He said, \"Hello!\"";
        
        dump(literal);
        dump(escaped);
        dump(quote);
    }
}