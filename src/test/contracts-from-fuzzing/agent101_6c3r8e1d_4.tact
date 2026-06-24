contract TestContract {
    receive() {
        // Test escape sequences in string literal
        let s: String = "Quote: \" and null char: \x00 and unicode: \u0041";
    }
}
