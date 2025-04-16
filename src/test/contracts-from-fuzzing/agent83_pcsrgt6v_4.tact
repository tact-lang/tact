contract Test {
    x: Int = 0;

    receive(str: String) {
        self.x = 2;
    }
}
