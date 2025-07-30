contract TestStrings {
    receive() {
        let s: String = "Hello, \rWorld!";
        dump(s);
    }
}