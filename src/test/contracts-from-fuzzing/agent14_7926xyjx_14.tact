contract Test {
    s: String = "Static string data";

    receive() {
        dump(self.s);
    }
}