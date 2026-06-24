contract TestGetterSlice2 {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.data.beginParse();
    }
}
