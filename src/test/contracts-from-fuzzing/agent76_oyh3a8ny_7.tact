contract TestMultipleEscapes {
    receive() {
        // Testing multiple escape sequences in a single string literal
        let s: String = "backslash \\ double quote \" newline \n tab \t unicode emoji: \u{1F602}";
        let slice: Slice = s.asSlice();
    }
}
