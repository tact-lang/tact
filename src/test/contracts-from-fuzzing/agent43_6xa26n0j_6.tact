contract Test {
    const A: Int = 21 + 21;

    receive() {
        let x: Int = self.A;
    }
}
