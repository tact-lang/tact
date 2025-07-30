contract TestStrings {
    receive() {
        let s: String = "Hello, \nWorld!";
        dump(s);
    }
}