contract TestContract {
    receive() {
        let s: String = "Hello";
        dump(s);
    }
}