contract StringTest {
    receive() {
        let unicodeString: String = "Unicode emoji: 😃";
        dump(unicodeString);
    }
}