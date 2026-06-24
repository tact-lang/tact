contract TestPow() {
    // Testing the pow built-in function at compile-time
    // According to the documentation, pow(2, 3) should yield 8, and pow(5, 0) should yield 1
    const P1: Int = pow(2, 3);
    const P2: Int = pow(5, 0);

    receive() {
        dump(self.P1); // Expected output: 8
        dump(self.P2); // Expected output: 1
    }
}
