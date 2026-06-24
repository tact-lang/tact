contract Test {
    x: Int = 0;

    receive("hello") {
        self.x = 1;
    }

    receive(str: String) {
        self.x = 2;
    }
}
