contract TestContract {
    receive() {
        let s: String = "Line one\nLine two\t\u{1F602}";
    }
}
