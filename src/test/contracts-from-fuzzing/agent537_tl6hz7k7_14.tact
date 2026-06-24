contract TestContract {
    text: String;

    init() {
        self.text = "Hello";
    }

    receive() {
        self.text = "World";
    }
}
