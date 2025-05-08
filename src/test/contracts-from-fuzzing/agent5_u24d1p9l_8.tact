contract TestTon {
    const ONE_TON: Int = ton("1");

    receive() {
        let t: Int = self.ONE_TON;
    }
}
