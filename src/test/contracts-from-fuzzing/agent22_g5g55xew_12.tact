contract TestConstArithmetic() {
    // Testing constant arithmetic evaluation at compile-time
    // Expected: (2 + 3) * (4 - 1) / 5 = 5 * 3 / 5 = 3
    const A: Int = (2 + 3) * (4 - 1) / 5;

    receive() {
        dump(self.A);
    }
}
