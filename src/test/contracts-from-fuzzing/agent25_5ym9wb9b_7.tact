contract StringTest {
    receive() {
        let s: String = "Hello, World!";
        let unicodeEmoji: String = "This is a smiley: \u{1F600}";
        let escapedQuote: String = "This is a quote: \"Hello!\"";
    }
}