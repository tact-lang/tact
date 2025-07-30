contract Test {
    receive() {
        // Testing valid escape sequences including newline, tab, backslash, double quote, and Unicode
        let s: String = "Line1\nLine2\tTab\\Quote: \" and smiley: \u263A";
    }
}
