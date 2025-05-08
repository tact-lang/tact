contract Test {
    receive() {
        // Testing Unicode escape sequence with variable-length form for 😂 emoji
        let s: String = "\u{1F602}";
        dump(s);
    }
}
