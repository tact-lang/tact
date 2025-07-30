contract TestContract {
    receive() {
        let s: String = "He said \"Hello!\"";
        let c = s.asComment();
    }
}