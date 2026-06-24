contract TestContract {
    s: String = "Global String";

    receive() {
        self.s.asComment();
    }
}