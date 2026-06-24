contract TestUnicodeExtended {
    receive() {
        // Testing Unicode extended escape sequence for the 😂 emoji
        let s: String = "\u{1F602}";
        dump(s);
    }
}
