contract TestUnicodeMax {
    receive() {
        // Test using a high Unicode escape sequence with variable length
        let s: String = "\u{1F603} is a smiling face, and \u{10FFFF} is the maximum Unicode value.";
        dump(s);
    }
}
