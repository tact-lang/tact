contract TestStringLiteral {
    receive() {
        let s: String = "hello, world";
        dump(s);
    }
}
