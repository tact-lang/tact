contract Test {
    const C: Int = 123;

    receive() {
        dump(self.C);
    }
}
