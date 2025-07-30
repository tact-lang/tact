contract TestEscapeSequences {
    // Testing string literal escape sequences in Tact
    // This contract tests standard escapes: \n, \t, hexadecimal, and unicode escapes.
    receive() {
        // Note: \ is itself escaped in the source code
        let s: String = "line1\nline2 \t tab:\x41 \u0042 \u{43}";
        // Converting string to slice to ensure it gets compiled and used
        let sl: Slice = s.asSlice();
        sl;
    }
}
