contract Test {
    text: String = "Hello,\nTact!";

    receive() {
        dump(self.text);
    }
}