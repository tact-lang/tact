contract Test {
    s: String = "Global string literal";

    receive() {
        let copy: String = self.s;
    }
}