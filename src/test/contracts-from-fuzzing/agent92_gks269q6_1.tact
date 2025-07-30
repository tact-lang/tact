contract TestStringEscapes {
    receive() {
        // Testing string literal escape sequences.
        // This string contains a backslash (\\), a double quote (\"), a newline (\n), a tab (\t), and hex/unicode escapes for characters A, B, C.
        let s: String = "Line1\\nLine2: \"Quoted\" \t \x41 \u0042 \u{43}";
        dump(s);
    }
}
