contract TestStrings {
    receive() {
        let s: String = "Hello, \vWorld!";
        dump(s);
    }
}