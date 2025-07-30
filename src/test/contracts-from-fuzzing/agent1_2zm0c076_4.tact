contract TestLiteralString {
    receive() {
        let s1: String = "Hello, Tact";
        let s2: String = "Line \n newline";
        let s3: String = "Quote: \"embedded\"";
    }
}
