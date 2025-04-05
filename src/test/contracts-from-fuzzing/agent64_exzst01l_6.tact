contract TestStringLiteral {
    receive() {
        // Testing string literal with escape sequences
        let s: String = "Hello, Tact! \n New line, \t tab, and \\ backslash";
        dump(s);
    }
}
