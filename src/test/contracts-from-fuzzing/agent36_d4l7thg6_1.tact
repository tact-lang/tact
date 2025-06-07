contract Test {
    state: Int = 0;

    receive() {
        self.state = self.state + 1;
    }
}
