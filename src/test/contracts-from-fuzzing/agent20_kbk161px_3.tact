contract TestContract {
    receive() {
        let s: String = "Hello\nWorld!";
        let c = s.asComment();
    }
}