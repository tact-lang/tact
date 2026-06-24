contract Test {
    const A: Int = 5 + 7;

    receive() {
        dump(self.A);
    }
}
