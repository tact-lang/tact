contract Test {
    receive() {
        // Testing valid escape sequences in a string literal
        let valid: String = "Hex: \x41, Unicode: \u0041, Emoji: \u{1F602}";
        dump(valid);
    }

    fun dump(s: String) {
        // no-op dump function
    }
}
