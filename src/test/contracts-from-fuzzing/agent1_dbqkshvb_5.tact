contract StringTest {
    receive() {
        let unicodeChar: String = "Hello \u{1F600} World!";
    }
}