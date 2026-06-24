contract Test {
    text: String = "Hello,\tTact!";

    receive() {
        dump(self.text);
    }
}