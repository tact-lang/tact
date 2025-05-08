contract TestLiteralString {
    receive() {
        let s1: String = "Hello, world!"; // simple string literal
        let s2: String = "Escaped \"Quote\" and newline\nSecond line";
        dump(s1);
        dump(s2);
    }
}
