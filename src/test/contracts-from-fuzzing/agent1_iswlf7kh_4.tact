contract TestStringEscapes {
    receive() {
        // Testing various escape sequences in string literals
        let s1: String = "Escaped \\ backslash";
        let s2: String = "He said: \"Tact is cool!\"";
        let s3: String = "Line1\nLine2";
        let s4: String = "Tab\tSeparated";
        let s5: String = "Unicode \u{1F602}"; // 😂 emoji
    }
}
