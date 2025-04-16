contract TestUnicodeEscapes {
    receive() {
        // Testing valid Unicode escape sequence with variable-length hex digits (smiling face emoji)
        dump("emoji: \u{1F600} looks like a smile");
    }
}
