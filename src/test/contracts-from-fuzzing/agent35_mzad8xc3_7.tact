contract Test {
    receive() {
        // Test multiple escape sequences in string literal
        // \n: newline, \t: tab, \u0021: Unicode exclamation mark
        let s: String = "Line1\nLine2\tTabbed\u0021";
        dump(s);
    }
}
