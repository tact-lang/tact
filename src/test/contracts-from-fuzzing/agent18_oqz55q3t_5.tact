contract Test3 {
    const X: Int = 42;

    receive() {
        dump(self.X);
    }
}
