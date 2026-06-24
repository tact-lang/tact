contract TestContract {
    receive() {
        let s: String = "Hello world!";
        let c = s.asComment();
    }
}