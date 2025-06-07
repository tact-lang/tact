contract Test {
    fun negativeInStoreUint() {
        let c = beginCell().storeUint(-1, 7).endCell();
    }

    receive() {
        self.negativeInStoreUint();
    }
}