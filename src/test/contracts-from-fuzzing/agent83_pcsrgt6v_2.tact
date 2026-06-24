contract Test {
    x: Int = 0;

    receive() {
        self.x = 1;
    }
}
