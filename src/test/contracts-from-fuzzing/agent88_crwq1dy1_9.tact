contract TestUnicodeEscapes {
    receive() {
        // Testing valid hex and Unicode escape sequences
        let s: String = "A hex letter: \x41, a unicode delta: \u0394, and extended emoji: \u{1F600}";
    }
}
