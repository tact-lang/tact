contract Test {
    receive() {
        // Testing proper escaping of double quotes in string literal
        let s: String = "He said: \"Hello world\"";
        dump(s);
    }
}
