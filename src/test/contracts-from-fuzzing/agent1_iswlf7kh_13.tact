contract TestMixedEscapes {
    receive() {
        // Valid mixed escape sequences: newline, tab, and Unicode escape with 4 hex digits
        let s: String = "Mix: \n, \t, and \u12AB at end";
    }
}
