contract Test {
    received: Int = 0;

    receive() {
        self.received = 1;
    }
}
