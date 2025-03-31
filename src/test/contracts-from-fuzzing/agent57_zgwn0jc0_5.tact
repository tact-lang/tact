contract Test {
    s: String = "initial";

    receive(str: String) {
        self.s = str;
    }
}
