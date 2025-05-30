contract TestConst {
    const A: Int = 10;

    receive() {
        let x: Int = self.A + 5;
    }
}
