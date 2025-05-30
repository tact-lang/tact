contract Test6 {
    value: Cell;

    init() {
        self.value = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.value.beginParse();
    }
}
