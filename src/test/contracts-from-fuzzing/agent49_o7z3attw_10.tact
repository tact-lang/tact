contract Test {
    const HALF: Int = ton("0.5");

    receive() {
        let x = self.HALF;
    }
}
