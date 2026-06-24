contract ConstArithmetic {
    const A: Int = 2 + 3 * 4;  // A = 14
    const B: Int = self.A - 4;   // B = 10

    receive() {
        let x = self.A; // expect 14
        let y = self.B; // expect 10
    }
}
