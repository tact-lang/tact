contract Test {
    text: String = "Hello,\vTact!";

    receive() {
        dump(self.text);
    }
}