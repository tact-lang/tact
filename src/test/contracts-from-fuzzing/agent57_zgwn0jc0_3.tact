contract Test {
    a: Int = 0;

    receive() {
        self.a = self.a + 1;
    }
}
