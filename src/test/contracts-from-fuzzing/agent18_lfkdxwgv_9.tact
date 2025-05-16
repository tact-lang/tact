contract Test {
    receive() {
        let s: String = "Hello \u{1F602} World!";
        dump(s);
    }
}