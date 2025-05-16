contract Test {
    receive() {
        // Testing various valid escape sequences in a string literal, including individual escapes:
        // newline, tab, backslash, double quote, and Unicode code point (😂) via \u{1F602}
        let s: String = "Line1\nLine2\twith a tab, a backslash \\ and a \"quote\", plus emoji: \u{1F602}";
    }
}
