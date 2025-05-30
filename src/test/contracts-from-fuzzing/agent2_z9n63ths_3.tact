contract StringLiteralExprTest {
    fun test() {
        // Testing simple string literal and escape sequences, including unicode escape
        let s1: String = "Hello, World!";
        let s2: String = "Line1\nLine2";
        let s3: String = "Emoji: \u{1F601}"; // 😀
        dump(s1);
        dump(s2);
        dump(s3);
    }

    receive() {
        self.test();
    }
}