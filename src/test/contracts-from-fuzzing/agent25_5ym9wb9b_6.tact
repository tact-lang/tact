contract StringTest {
    receive() {
        let s: String = "This string is totally valid!";
        let unicodeTest: String = "You can also use \u{1F602} for emojis.";
    }
}