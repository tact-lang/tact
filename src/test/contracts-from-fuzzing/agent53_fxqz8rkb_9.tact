contract Test5 {
    const T: Int = pow2(2) * 10; // Expected value: 4 * 10 = 40

    receive() {
        let result: Int = self.T;
    }
}
