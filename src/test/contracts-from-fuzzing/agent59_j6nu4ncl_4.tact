contract TestStrings {
    receive() {
        let s: String = "Hello, \"World!\"";
        dump(s);
    }
}