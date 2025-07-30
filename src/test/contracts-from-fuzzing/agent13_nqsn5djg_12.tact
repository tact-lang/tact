contract Test {
    empty: String = "";

    receive() {
        dump(self.empty);
    }
}