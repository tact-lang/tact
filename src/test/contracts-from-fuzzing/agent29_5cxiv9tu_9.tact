contract Test {
    get fun getSlice(): Slice {
        let c: Cell = beginCell().storeUint(123, 32).endCell();
        return c.beginParse();
    }

    receive() {
        self.getSlice();
    }
}
