contract TestValidEscape {
    receive() {
        // Testing valid escapes: newline, tab, quote, backslash, unicode escape
        let s: String = "Line1\nLine2\twith tab, quote: \" and backslash: \\ and unicode: \u0041";
        dump(s);
    }
}
