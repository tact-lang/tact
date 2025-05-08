contract Test {
    // Test multiple escape sequences in string literal
    receive() {
        let s: String = "A\nB\tC\\D\"E";
    }
}
