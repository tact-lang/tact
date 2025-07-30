contract Test {
    const A: Int = 4;

    receive() {
        if (self.A * 2 == 8) {
            // Valid arithmetic with constant A
        }
    }
}
