contract TestString {
    receive() {
        let s: String = "Hello, World!";
        dump(s);
    }
}