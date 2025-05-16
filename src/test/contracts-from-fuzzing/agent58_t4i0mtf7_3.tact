contract StringHandler {
    fun testEscapeSequences() {
        let backslash: String = "This is a backslash: \\";
        let newline: String = "This is the first line.\nThis is the second line.";
        let quote: String = "He said, \"It works!\"";

        dump(backslash);
        dump(newline);
        dump(quote);
    }
}