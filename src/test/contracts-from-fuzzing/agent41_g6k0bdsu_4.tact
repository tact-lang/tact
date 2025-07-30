contract TestLiteralString {
    receive() {
        let s: String = "Hello, Tact!";
        dump(s);
    }
}
