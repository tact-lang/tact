contract Test {
    text: String = "Hello, 🦊 Tact!";

    receive() {
        dump(self.text);
    }
}