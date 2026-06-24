contract Test {
    receive() {
        // Testing string literal with vertical tab escape sequence \v (if supported)
        let s: String = "Vertical tab: \v";
    }
}
