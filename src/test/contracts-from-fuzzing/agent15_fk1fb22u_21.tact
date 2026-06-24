contract TestContract {
    receive() {
        let s = "Hello \u{10FFFF}";
    }
}
