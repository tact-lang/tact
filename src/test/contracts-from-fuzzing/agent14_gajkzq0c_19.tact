contract Test {
    fun testStoreUintOverflow() {
        let c = beginCell().storeUint(999, 999).endCell();
    }

    receive() {
        self.testStoreUintOverflow();
    }
}