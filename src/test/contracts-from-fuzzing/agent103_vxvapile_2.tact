contract TestStringLiteral {
    receive() {
        let s: String = "Hello, Tact!";
        dump(s);
    }
}
