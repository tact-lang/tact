contract TestStringLiterals {
    receive() {
        // String with newline escape
        let a: String = "Hello\nWorld";
        // String with escaped double quote
        let b: String = "Quote: \"Hello\"";
        dump(a);
        dump(b);
    }
}
