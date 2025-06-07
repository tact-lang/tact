contract TestContract {
    receive() {
        let s: String = "Hello, World!";
        dump(s);
    }
}