contract Test {
    const A: Int = 10;
    const B: Int = 2;
    const C: Int = self.A + self.B;

    receive() {
        let x: Int = self.C;
    }
}
