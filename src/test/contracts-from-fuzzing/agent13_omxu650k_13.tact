contract Test {
    receive() {
        // Testing multiple escape sequences in a single string literal
        let s: String = "Line1\nLine2: \"quoted\", tab:\t, backslash:\\";
        dump(s);
    }
}
