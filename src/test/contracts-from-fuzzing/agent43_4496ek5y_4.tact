contract TestContract {
    receive() {
        let s: String = "Unicode test: \u{1F600}"; // 😀 emoji
        dump(s);
    }
}