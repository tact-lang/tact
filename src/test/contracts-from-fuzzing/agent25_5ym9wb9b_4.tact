contract StringTest {
    receive() {
        let s: String = "This is a test string with a Unicode character: \u{1F600}"; // Smiling face emoji
    }
}