contract StringTest {
    receive() {
        let s: String = "String with unicode: \u{1F602}";
    }
}