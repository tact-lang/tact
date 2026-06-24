contract Test {
    fun testNegativeBitLength() {
        let c = beginCell().storeUint(42, -1).endCell();
    }

    receive() {
        self.testNegativeBitLength();
    }
}