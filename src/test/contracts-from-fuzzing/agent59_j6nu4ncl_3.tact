contract TestStrings {
    receive() {
        let s: String = "Hello, \tWorld!";
        dump(s);
    }
}