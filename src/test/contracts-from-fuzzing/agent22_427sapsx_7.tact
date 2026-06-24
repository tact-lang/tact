contract Test {
    receive() {
        let s: String = "Invalid hex: \x123";
    }
}
